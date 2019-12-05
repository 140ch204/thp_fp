class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	before_action :check_user, only: [:index, :show, :edit, :update, :destroy]


	def index
		@users = User.all
	end

	def show
    @user = current_user
    @admin_collection = Admin.where(user: current_user)
    @is_admin = Admin.find_by(user: current_user)
    @organization = @is_admin.organization
    @project = @organization.projects[0]
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def check_user
		if current_user.id != User.find(params[:id]).id
			flash[:notice] = "You can't see that."
			redirect_to root_path
		end
	end
	
end
