class DonationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:new, :create]

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


  private

  def check_user
    @organization = Organisation.find(Project.find(params[:project_id]).organization_id)
    unless @organization.is_organization_admin(current_user) == true
      flash[:notice] = "Bien essayé petit malin."
      redirect_to root_path
    end
  end
end
