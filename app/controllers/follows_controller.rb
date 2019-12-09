class FollowsController < ApplicationController

	def create
		@follow = Follow.new(user_id: current_user.id, organization_id: params[:organization_id], is_following: true )
		@follow.save
		flash[:success] = "Vous suivez cette organisation!"
		redirect_to test_path
	end

	def destroy
		@follow = Follow.find_by(user_id: current_user.id, organization_id: params[:id])
		@follow.destroy
		flash[:success] = "Vous ne suivez plus cette organisation!"
		redirect_to test_path
	end

end
