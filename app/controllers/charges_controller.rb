class ChargesController < ApplicationController
  def new
    @user = current_user
    @organization = Organization.find(params[:organization_id].to_i)
    @donation_amount = params[:donation_amount]
    
  end
  
  def create
    # Amount in cents
    @amount = params[:amount]
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
    
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
