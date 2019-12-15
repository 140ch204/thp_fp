class AvatarsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@user.avatar.attach(params[:avatar])
		flash[:success] = "Votre photo de profil a bien été enregistrée"
		redirect_to request.referrer
	end
end
