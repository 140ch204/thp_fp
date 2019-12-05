class Organization < ApplicationRecord
	has_many :admins
	has_many :projects
	has_many :donations
	has_many :users, through: :admins
	has_many :counterparts, through: :donations
	belongs_to :city

	def is_creating_project_permitted(user)
		if self.is_association = true && self.is_association_admin(user) && !user.nil?
			return true
		end
	end

	def is_association_admin(user)
		self.user_ids.include?(user.id) if !user.nil?	
	end

end
