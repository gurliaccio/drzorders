class UserMailer < ApplicationMailer
  default from: "gamichaelatl@gmail.com"
   def response_email(user)
    @user = user
    @url  = 'https://drzorders.herokuapp.com'
    mail(to: @user.email, subject: 'Doctor Zorders')
   end
end