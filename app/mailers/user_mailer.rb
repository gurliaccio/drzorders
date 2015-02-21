class UserMailer < ApplicationMailer
  default from: "gamichaelatl@gmail.com"
   def response_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Doctor Zorders')
  end
end
