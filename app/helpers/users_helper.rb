module UsersHelper

	def is_master?
		if !current_user.nil? && current_user.master = true
			return true
			flash[:notice] = "You can't access admins' pages."
		end
	end

	def check_user
		if current_user.id != User.find(params[:id]).id
			flash[:notice] = "You can't see that."
			redirect_to root_path
		end
	end

end
