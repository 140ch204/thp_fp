class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	before_action :check_user, only: [:index, :show, :edit, :update, :destroy]


	def index
		@users = User.all
	end

	def show
		@user = current_user 
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

	def is_master?
		if !current_user.nil? && current_user.master = true
			return true
			flash[:notice] = "You can't access admins' pages."
		end
	end

	def check_user
		if current_user.id != User.find(params[:id]).id
			flash[:notice] = "You can't see that."
			redirect_to root_path
		end
	end
end
