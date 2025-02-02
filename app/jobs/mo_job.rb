class MoJob < ApplicationJob
  queue_as :default


  #execute all methods to get missouri files and send email of status
  def perform(*args)
    missouri = MoJob.new  
    missouri.login 
    missouri.get_files  
    missouri.create_missouri_data 
    missouri.check_data 
    missouri.logout
    @file_status = "Unknown"
    MissouriDatum.destroy_all 
  end

  attr_accessor  :s3, :date_time, :file_names, :downloads, :sorted_downloads

  # initialize instance of MoJob
  def initialize 
    @s3 = Aws::S3::Resource.new(region: 'us-east-1', access_key_id: Rails.application.credentials.dig(:aws, :access_key_id), secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key))
    @date_time = Time.new 
    @file_names = []
    @downloads = []
    @sorted_downloads
  end 


  # login to 'moftp.mo.gov', the sftp server. If error, email notice. 
  def login
    puts "logging in"
    tries ||= 3
    @@sftp = Net::SFTP.start('moftp.mo.gov', Rails.application.credentials[:missouri_username], password: Rails.application.credentials[:missouri_password], number_of_password_prompts: 0 )
    puts "logon successful!"
    rescue Net::SSH::AuthenticationFailed 
      tries -= 1
      if tries > 0  
        puts "Trying again: #{tries}"
        retry
      else
        puts "Logon failed. Try again later."
        UserMailer.login_error.deliver_now!
        @@sftp = nil
        return
      end
  end

  # get files from sftp server and push in to @downloads
  def get_files 
    puts "getting files..."
    @@sftp.dir.foreach('/Distribution/dor/modlpool_daily/') do |entry|
      download = @@sftp.download!("/Distribution/dor/modlpool_daily/#{entry.name}")
      @file_names << "#{entry.name}_#{date_time}"
      @downloads << download
    end
    puts "files downloaded!"
    @sorted_downloads = downloads.sort 
  end

  # create saved instance of missouri data in ActiveRecord model MissouriDatum
  def create_missouri_data
    missouri_data = MissouriDatum.create(file_small: @file_names[1], file_large: @file_names[0])
    puts "Instance saved!"
  end 

  # parse files based on rather it's a new file from the last downloaded or the same
  def parse_data
    puts "now parsing"
    parsed_file = @downloads[0].split(' ', -1) 
    # BigFile.create(file: @downloads[2])
    if parsed_file[7] == MissouriDatum.order(created_at: :desc).limit(2).last.parsed_timestamp
      MissouriDatum.last.update(parsed_timestamp: parsed_file[7], new_file: false)
    else                    
      MissouriDatum.last.update(parsed_timestamp: parsed_file[7], new_file: true)
    end 
  end

  # check data whether same or new and upload to coresponding file on AWS S3 bucket 
  def check_data
    if MissouriDatum.last.new_file
      @downloads.each_with_index do |download, index|
        obj = s3.bucket('missouridata').object("new/#{file_names[index]}")
        @file_status = "new"
        puts "new file"
        upload(obj, download)
      end
    else      
      downloads.each_with_index do |download, index|
        obj = s3.bucket('missouridata').object("same/#{file_names[index]}")
        @file_status = "same"
        puts "same file"
        upload(obj, download)
      end
    end 
  end 

  # the method that actually uploads to s3
  def upload(obj, download) 
    obj.put(body: download)
  end

  #logout of sftp and mail success 
  def logout 
    @@sftp.close_channel
    puts "Logged out"
    UserMailer.success(@file_status).deliver_now!
  end

end
