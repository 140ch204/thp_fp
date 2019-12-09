class LikesController < ApplicationController

	def create
		@like = Like.new(user_id: current_user.id, project_id: params[:project_id], is_liking: true )
		@like.save
		flash[:success] = "Vous aimez ce projet!"
		redirect_to test_path

	end

	def destroy
		@like = Like.find_by(user_id: current_user.id, project_id: params[:id])
		@like.destroy
		flash[:success] = "Vous n'aimez plus ce projet!"
		redirect_to test_path
	end

end
