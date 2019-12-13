class AvatarsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		if @user.avatar.attach(params[:avatar])? == true
			@user.avatar.attach(params[:avatar])
			redirect_to user_path(@user)
		else
			flash[:danger] = "Choisissez une nouvelle photo de profil"
			redirect_to request.referrer
		end
	end
end
