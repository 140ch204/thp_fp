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

  def new
    @city = City.new
    @department = Department.new
    @organization = Organization.new
    @is_association = params[:association]
  end

  def create
    @organization = Organization.new(organization_params)
    @country = Country.find_or_create_by(country_params)
    @department = Department.find_or_create_by(country: @country, 
                                              department_name: params[:department][:department_name], 
                                              zip_code: params[:department][:zip_code],
                                              region: params[:department][:region] )
    @city = City.find_or_create_by(department: @department, city_name: params[:city][:city_name])
    @organization.update(city_id: @city.id)

    if @organization.save
      Admin.create(user: current_user, organization: @organization)
      current_user.update(is_admin: true)
      if @organization.is_association == true
        flash[:success] = "Votre association a bien été enregistrée"
      else
        flash[:success] = "Votre entreprise a bien été enregistrée"
      end
        redirect_to organization_path(@organization.id)
    else
      flash[:danger] = "Erreur"
      render 'new'
    end
  end


  private

  def organization_params
    params.require(:organization).permit(:name, :description, :category, :logo_url, :RNA, :is_association, :is_company, :siret)
  end

  def city_params
    params.require(:city).permit(:city_name)
  end

  def department_params
    params.require(:department).permit(:department_name, :zip_code, :region)
  end

  def country_params
    params.require(:country).permit(:country_name)
  end
end
