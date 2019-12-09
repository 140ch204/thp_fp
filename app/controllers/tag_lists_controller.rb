class TagListsController < ApplicationController

	def create
		@tagged = TagList.new(tagged_params)
		if @tagged.save
			flash[:success] = "Vous avez ajouté un tag!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end

	end

	def destroy
		@tagged = TagList.find(params[:id])
		if @tagged.destroy
			flash[:success] = "Ce tag a été retiré!"
			redirect_to test_path
		else
			flash[:danger] = "Un problème est survenu!"
			redirect_to test_path
		end
	end

	private

	def tagged_params
		params.permit(:id, :tag_id, :organization_id)
	end

end
