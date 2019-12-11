class OrganizationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :check_user, only: [:edit, :update]

  def index
    @associations = Organization.where(is_association: true)
    @companies = Organization.where(is_company: true)
    @user = current_user
    @is_association = params[:association]
  end

  def show
    @current_organization = Organization.find(params[:id])
    @associations = Organization.where(is_association: true)
    @companies = Organization.where(is_company: true)
    @user = current_user
    @projects = Project.where(organization_id:@current_organization.id).all

  end

  def new
    @city = City.new
    @department = Department.new
    @organization = Organization.new(organization_params)
    @is_association = params[:association]
  end

  def create
    @organization = Organization.new(organization_params)
    location_params
    @organization.update(city_id: @city.id)
    if @organization.save
      Admin.create(user: current_user, organization: @organization)
      if @organization.is_association == true
        flash[:success] = "Votre association a bien été enregistrée"
      else
        flash[:success] = "Votre entreprise a bien été enregistrée"
      end
      redirect_to organization_path(@organization.id)
    else
      flash[:danger] = "#{@organization.errors.full_messages}"
      redirect_to new_organization_path(:association => params[:organization][:is_association])
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    @city = City.find(@organization.city_id)
    @department = Department.find(@city.department_id)
    @country = Country.find(@department.country_id)
  end

  def update
    @organization = Organization.find(params[:id])
    location_params
    @organization.update!(city_id: @city.id)

    if @organization.update!(organization_params)

      flash[:success] = "La page de votre organisation a bien été mise à jour"
      redirect_to organization_path(@organization.id)
    else
      flash[:danger] = "Erreur"
      render 'edit'
    end
  end


  private

  def organization_params
    params.require(:organization).permit(:name, :description, :category, :logo_url, :RNA, :is_association, :is_company, :siret) rescue nil
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

  def location_params
    @country = Country.find_or_create_by(country_params)
    @department = Department.find_or_create_by(country: @country, 
      department_name: params[:department][:department_name], 
      zip_code: params[:department][:zip_code],
      region: params[:department][:region] )
    @city = City.find_or_create_by(department: @department, city_name: params[:city][:city_name])
  end

  def check_user
    @organization = Organization.find(params[:id])
    unless @organization.is_organization_admin(current_user) == true
      flash[:notice] = "Seul l'administrateur peut faire cela."
      redirect_to root_path
    end
  end

end
