class UserMailer < ApplicationMailer
    

    # def data_downloaded  
    #     mail(to: "demiansims@gmail.com, dyu@tml.com", 
    #         subject: "Missouri file downloaded",
    #         body: "A new file was downloaded from MO"
    #     )
    # end

    def login_error 
        mail(to: "demiansims@gmail.com, dyu@tml.com", 
            subject: "LOGIN ERROR",
            body: "Error logging in to Missouri. Please contact."
        )
    end 

    def success(file_status) 
       mail(to: "demiansims@gmail.com, dyu@tml.com",
            subject: "LOGIN SUCCESSFUL",
            body: "The login and download was successful. The 
                    file was #{file_status}."
        ) 
    end 
end

# dyu@tml.com
