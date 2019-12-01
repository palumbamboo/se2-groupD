class OfficerMailer < ApplicationMailer

    def credential_mail
        @user = params[:user]
        @password = params[:current_pass]
        mail(to: @user.email, subject: "Your account credentials")
    end
end
