class UserMailer < ActionMailer::Base
  default from: "from@example.com"
   def welcome_email(user)
    @user = user
    @url  = 'https://whispering-castle-2494.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
