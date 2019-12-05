class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @donation = Donation.new
  end

  def create
  end

  def new
    
  end

  def update
  end

  def destroy
  end

end
