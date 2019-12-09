class UserMailer < ApplicationMailer
	default from: 'no-reply@assoangels.fr'

	def welcome_email_A_supprimer(user)
    @user = user 

    @url  = 'https://assoangels.herokuapp.com//login' 

    @url

    mail(to: @user.email, subject: 'Bienvenue chez AssoAngels!') 
  end

  def welcome_email(user)
    @user= user
    mail(from: 'contact@assoangels.com', to: 'assoangels@yopmail.com',
         subject: 'This is a nice welcome email')
  end

end
