class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	before_action :check_user, only: [:index, :show, :edit, :update, :destroy]


	def index
		@users = User.all
	end

  def show
    @city = City.new
    @user = current_user
    @admin_collection = Admin.where(user: current_user)
    @is_admin = Admin.find_by(user: current_user)
    @organization = @is_admin.organization rescue nil
    @project = @organization.projects[0]  rescue nil
	end

	def new
	end

	def create
	end

	def edit
	end

  def update
    @user = current_user
      respond_to do |format|
        if @user.update_attributes(permitted_user_params)
          format.html { redirect_to user_path(params[:id]) }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
	end

	def destroy
	end

	private

	def check_user
		if current_user.id != User.find(params[:id]).id
			flash[:notice] = "Bien essayé petit malin."
			redirect_to root_path
		end
	end
  
  def permitted_user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end