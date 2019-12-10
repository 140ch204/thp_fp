class ProjectLinksController < ApplicationController

	def create
		@link = ProjectLink.new(link_params)    
		if @link.save
			flash[:success] = "Le lien a été ajouté!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

	def destroy
		@link = ProjectLink.find_by(id: params[:id])
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
		params.permit(:url_project, :project_id)
	end

end