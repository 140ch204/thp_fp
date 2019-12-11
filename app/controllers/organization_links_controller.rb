class OrganizationLinksController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :check_user, only: [:destroy]

	def create
		@link = OrganizationLink.new(link_params)    
		if @link.save
			flash[:success] = "Le lien a été ajouté!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

	def destroy
		@link = OrganizationLink.find_by(id: params[:id])
		if @link.destroy
			flash[:success] = "Le lien a été supprimé!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

	private

	def link_params
		params.permit(:url_organization, :organization_id)
	end

	def check_user
		@organization = Organization.find(OrganizationLink.find(params[:id]).organization_id)
		unless @organization.is_organization_admin(current_user) == true
			flash[:notice] = "Bien essayé petit malin."
			redirect_to root_path
		end
	end

end
