class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation_amount = params[:donation][:donation_amount]
    @project_id = params[:donation][:project_id]
    redirect_to new_charge_path(:donation_amount => @donation_amount, 
                                :project_id => @project_id)
  end
end
