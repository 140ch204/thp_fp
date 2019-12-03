class UserMailer < ApplicationMailer
	default from: 'no-reply@assoangels.fr'

	def welcome_email(user)
    @user = user 

    @url  = 'https://assoangels.herokuapp.com//login' 

    @url

    mail(to: @user.email, subject: 'Bienvenue chez AssoAngels!') 
end
end
