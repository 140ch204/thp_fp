class TagListsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :check_user, only: [:create, :destroy]

	def create
		@tagged = TagList.new(tagged_params)
		if @tagged.save
			flash[:success] = "Vous avez ajouté un tag!"
			redirect_to request.referrer
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to request.referrer
		end

	end

	def destroy
		@tagged = TagList.find(params[:id])
		if @tagged.destroy
			flash[:success] = "Ce tag a été retiré!"
			redirect_to request.referrer
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to request.referrer
		end
	end

	private

	def tagged_params
		params.permit(:id, :tag_id, :organization_id)
	end

	def check_user
		@organization = Organization.find(params[:organization_id])
		unless @organization.is_organization_admin(current_user) == true
			flash[:notice] = "Bien essayé petit malin."
			redirect_to root_path
		end
	end

end
