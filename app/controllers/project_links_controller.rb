class ProjectLinksController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :check_user, only: [:create, :destroy]

	def create
		@link = ProjectLink.new(link_params)    
		if @link.save
			respond_to do |format|
				format.html { redirect_to request.referrer, :flash => { :success => "Le lien a été ajouté!" } }
				format.js { }
			end
		else
			flash[:danger] = "#{@link.errors.full_messages}"
			redirect_to request.referrer
		end
	end

	def destroy
		@link = ProjectLink.find_by(id: params[:id])
		if @link.destroy
			respond_to do |format|
				format.html { redirect_to request.referrer, :flash => { :success => "Le lien a été supprimé!" } }
				format.js { }
			end
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to request.referrer
		end
	end

	private

	def link_params
		params.permit(:url_project, :url_name, :project_id)
	end

	def check_user
		@organization = Organization.find(params[:organization_id])
		unless @organization.is_organization_admin(current_user) == true
			flash[:notice] = "Bien essayé petit malin."
			redirect_to root_path
		end
	end

end
