class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new
    @donation_amount = params[:donation][:donation_amount]
    @project_id = params[:donation][:project_id]
    if @donation_amount.blank? == true
      flash[:danger] = "Choisissez un montant"
      redirect_to new_donation_path(:project_id => @project_id) 
    else
      redirect_to new_charge_path(:donation_amount => @donation_amount, 
                                  :project_id => @project_id)
    end
  end
end
