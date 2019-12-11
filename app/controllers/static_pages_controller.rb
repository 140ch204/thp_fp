class StaticPagesController < ApplicationController

  def show
  	@project = Project.first
  	@admin_collection = Admin.where(user: current_user)
  end

  def index
    @projects = Project.all
    @project = @projects.sample(3)
  end
  
end
