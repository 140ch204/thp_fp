class AvatarsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		if @user.avatar.attach(params[:avatar])
			flash[:success] = "votre photo de profil est enregistrée"
			redirect_to request.referrer
		else
			flash[:danger] = "Choisissez une nouvelle photo de profil"
			redirect_to request.referrer
		end
	end
end
