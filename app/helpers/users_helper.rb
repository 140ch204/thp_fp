module UsersHelper

	def is_master?
		if !current_user.nil? && current_user.master == true
			return true
			flash[:notice] = "You can't access masters' pages."
		end
	end

	def is_admin?
		if !current_user.nil? && current_user.is_admin == true
      return true
			flash[:notice] = "You can't access admins' pages."
		end
	end

end
