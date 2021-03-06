class DonationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:new]

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
      if @donation_amount.to_i < 1 || @donation_amount.to_i > 999_999.99
        flash[:danger] = 'Le montant minimum est de 1€, le montant maximum est de 999,999,99€'
        redirect_to new_donation_path
      else
        redirect_to new_charge_path(:donation_amount => @donation_amount, 
                                    :project_id => @project_id)
      end
    end
  end

  private

  def check_user
    @is_admin = Admin.find_by(user: current_user)
    @organization = @is_admin.organization rescue nil
    unless @organization.company? == true
      flash[:notice] = "Seule une entreprise peut financer un projet."
      redirect_to root_path
    end
  end
end