class ChargesController < ApplicationController
  after_action :generate_donation, only: [:create]
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @user = current_user
    @admin = Admin.find_by(user: current_user)
    @organization = @admin.organization
    @donation_amount = params[:donation_amount]
    
  end
  
  def create    
    @amount = params[:amount].to_i * 100
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Merci pour votre don !",
      currency: 'eur',
    })
    
    redirect_to project_path(params[:project_id])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def generate_donation
    @project = params[:project_id]
    @admin = Admin.find_by(user: current_user)
    @organization = @admin.organization
    @donation_amount = params[:amount]
    @donation = Donation.new(donation_amount: @donation_amount, project_id: @project, organization: @organization)
    if @donation.save
      flash[:success] = "Votre don à bien été pris en compte"
    else 
      flash[:danger] = "Erreur"
    end
  end

end