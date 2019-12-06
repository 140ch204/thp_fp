class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @current_organization = Organization.find(@project.organization_id)
    @user = current_user
    @donation = Donation.new
  end

  def new
    @city = City.new
    @department = Department.new
    @project = Project.new
    @organization = Organization.find_by(id: params[:organization_id])
  end

  def create
    @project = Project.new(project_params)
    @country = Country.find_or_create_by(country_params)
    @department = Department.find_or_create_by(country: @country, 
      department_name: params[:department][:department_name], 
      zip_code: params[:department][:zip_code],
      region: params[:department][:region] )
    @city = City.find_or_create_by(department: @department, city_name: params[:city][:city_name])
    @project.city_id = @city.id

    if @project.save
      flash[:success] = "Votre projet a bien été enregistré"
      redirect_to project_path(@project.id)
    else
      flash[:danger] = "Erreur"
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
    @city = City.find(@project.city_id)
    @department = Department.find(@city.department_id)
    @organization = Organization.find(@project.organization_id)
  end

  def update
    @project = Project.find(params[:id])
    @city = City.find(@project.city_id)
    # @department = Department.find(@city.department_id)
    @city.update!(city_params)
    # @department.update!(department_params)
    # @country.update!(country_params)

    if @project.update!(project_params)
      flash[:success] = "Votre projet a bien été mis à jour"
      redirect_to project_path(@project.id)
    else
      flash[:danger] = "Erreur"
      render 'edit'
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:organization_id, :city_id, :name, :description, :starting_date, :donation_targeted, :logo_url, :donation_start, :donation_end)
  end

  def country_params
    params.require(:country).permit(:country_name)
  end


  def city_params
    params.require(:city).permit(:city_name)
  end

  def department_params
    params.require(:department).permit(:department_name, :zip_code, :region)
  end

end
