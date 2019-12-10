class TagsController < ApplicationController

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

end
