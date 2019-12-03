class ChargesController < ApplicationController
  def new
    #@organization = current_user.organization
    #@donation_amount = params[:donation_amount]
    
  end
  
  def create
    # Amount in cents
    @amount = params[:donation_amount]
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Donation from #{@admin.organization}",
      currency: 'eur',
    })
    
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
