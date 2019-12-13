class UserMailer < ApplicationMailer
  default from: 'no-reply@assoangels.fr'

  def welcome_email(user)
    @user = user 
    @url  = 'https://assoangels.herokuapp.com'
    @url2  = 'https://assoangels.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue chez AssoAngels!') 
  end

  def thanks_for_donation_email(donation)
    @project = donation.project
    @company = donation.organization
    @admin_collection = donation.organization.admins
    @url  = 'https://assoangels.herokuapp.com' 
    @donation_amount = donation.donation_amount
    @admin_collection.each do |admin|
      mail(to: admin.user.email, subject: 'Merci pour votre don !')
    end
  end

  def donation_received_email(donation)
    @project = donation.project
    @company = donation.organization
    @admin_collection = donation.project.admins
    @url = 'https://assoangels.herokuapp.com'
    @donation_amount = donation.donation_amount
    @admin_collection.each do |admin|
      mail(to: admin.user.email, subject: "Votre projet #{ @project.name } à reçu un nouveau don !")
    end
  end
end