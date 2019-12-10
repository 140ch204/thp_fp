class FollowsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]


	def create
		@follow = Follow.new(user_id: current_user.id, organization_id: params[:organization_id], is_following: true )
		if @follow.save
			flash[:success] = "Vous suivez cette organisation!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

	def destroy
		@follow = Follow.find_by(user_id: current_user.id, organization_id: params[:id])
		if @follow.destroy
			flash[:success] = "Vous ne suivez plus cette organisation!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end


end
