module UsersHelper

	def is_master?
		if !current_user.nil? && current_user.master == true
			return true
			flash[:notice] = "Ce sont des pages privées, merci."
		end
	end
end
