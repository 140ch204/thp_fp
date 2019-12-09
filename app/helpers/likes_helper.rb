module LikesHelper

  def is_liking?(project)
    if Like.find_by(user_id: current_user.id, project_id: project.id).nil?
      return false
    else 
      return true
    end
  end

end
