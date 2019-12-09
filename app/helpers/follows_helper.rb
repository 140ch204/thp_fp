module FollowsHelper

  def is_following?(organization)
    if Follow.find_by(user_id: current_user.id, organization_id: organization.id).nil?
      return false
    else 
      return true
    end
  end

end
