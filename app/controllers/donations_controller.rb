class DonationsController < ApplicationController

  def new
  end

  def create
    @project = params[:donation][:project_id]
    @admin = Admin.find_by(user: current_user)
    @organization = @admin.organization
    @donation_amount = params[:donation][:donation_amount]
    @donation = Donation.new(donation_amount: @donation_amount, project_id: @project, organization: @organization)
    if @donation.save
      redirect_to new_charge_path(organization_id: @organization, donation_amount: @donation_amount)
    end
    puts "=" *50
    puts @donation.errors.messages
    puts @donation.donation_amount
    puts @donation.project.name
    puts @donation.organization.name
    puts "=" *50
  end
end
