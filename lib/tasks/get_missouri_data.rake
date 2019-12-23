# namespace :get_missouri_data do
    desc 'Retrieve daily missouri data file and send to receivers' 
    task :update_missouri => :environment do
        mj = MoJob.new 
        mj.perform 
    end

    # desc 'Send email' 
    # task :send_email => :environment do
    #     UserMailer.data_downloaded.deliver_now   
    # end


# end
