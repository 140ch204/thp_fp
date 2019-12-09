class OrganizationLinksController < ApplicationController

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

end
