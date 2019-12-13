class TagsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	before_action :check_user, only: [:create]

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			flash[:success] = "Vous avez créé un nouveau tag!"
			redirect_to request.referrer
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to request.referrer
		end

	end

	private

	def tag_params
		params.permit(:tag_name)
	end

	def check_user
		@organization = Organization.find(params[:organization_id])
		unless @organization.is_organization_admin(current_user) == true
			flash[:notice] = "Bien essayé petit malin."
			redirect_to root_path
		end
	end

end