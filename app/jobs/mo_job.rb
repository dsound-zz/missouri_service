class MoJob < ApplicationJob
  queue_as :default

  

  def perform(*args)
    missouri = MoJob.new  
    missouri.login 
    missouri.get_files 
    missouri.create_missouri_data 
    missouri.check_data 
    missouri.logout
    @file_status = "Unknown"
  end

  attr_accessor  :s3, :date_time, :file_names, :downloads, :sorted_downloads

  def initialize 
    @s3 = Aws::S3::Resource.new(region: 'us-east-1', access_key_id: Rails.application.credentials.dig(:aws, :access_key_id), secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key))
    @date_time = Time.new 
    @file_names = []
    @downloads = []
    @sorted_downloads
  end 



  def login
    counter = 0
    begin
      counter += 1
      byebug 
      @@sftp = Net::SFTP.start('moftp.mo.gov', Rails.application.credentials[:missouri_username], password: Rails.application.credentials[:missouri_password], number_of_password_prompts: 0 )

    rescue Net::SSH::AuthenticationFailed 
   
    retry if counter <=2
    ensure     
      UserMailer.login_error.deliver_now if Net::SSH::AuthenticationFailed
    end
  end


  def get_files 
    @@sftp.dir.foreach('/Distribution/dor/modlpool_daily/') do |entry|
      download = @@sftp.download!("/Distribution/dor/modlpool_daily/#{entry.name}")
      @file_names << "#{entry.name}_#{date_time}"
      @downloads << download
      puts "getting files"
    end
    @sorted_downloads = downloads.sort 
  end


  def create_missouri_data
    missouri_data = MissouriDatum.new(file_small: @file_names[1], file_large: @file_names[0])
     if missouri_data.save 
     parse_data
      puts "Instance saved!"
    else
      puts "Instance did not save!"
      perform 
    end
  end 


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


  def check_data
    if MissouriDatum.last.new_file
      @downloads.each_with_index do |download, index|
        obj = s3.bucket('missouridata').object("new/#{file_names[index]}")
        @file_status = "new"
        upload(obj, download)
      end
    else      
      downloads.each_with_index do |download, index|
        obj = s3.bucket('missouridata').object("same/#{file_names[index]}")
        @file_status = "same"
        upload(obj, download)
      end
    end 
  end 


  def upload(obj, download) 
    obj.put(body: download)
  end


  def logout 
    @@sftp.close_channel
    puts "Logged out"
    UserMailer.success(@file_status).deliver_now!
  end

end
