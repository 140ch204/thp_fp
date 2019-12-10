class LikesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@like = Like.new(user_id: current_user.id, project_id: params[:project_id], is_liking: true )
		if @like.save
			flash[:success] = "Vous aimez ce projet!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end

	end

	def destroy
		@like = Like.find_by(user_id: current_user.id, project_id: params[:id])
		if @like.destroy
			flash[:success] = "Vous n'aimez plus ce projet!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

end
