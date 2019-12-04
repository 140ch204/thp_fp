class OrganizationsController < ApplicationController

  def index
    @associations = Organization.where(is_association: true)
    @companies = Organization.where(is_company: true)
    @user = current_user
  end

  def show
    @current_organization = Organization.find(params[:id])
    @associations = Organization.where(is_association: true)
    @companies = Organization.where(is_company: true)
    @user = current_user
  end
end
