class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @current_project = Project.find(params[:id])
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
