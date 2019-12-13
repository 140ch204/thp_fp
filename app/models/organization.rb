class Organization < ApplicationRecord
	has_many :admins
	has_many :projects
	has_many :donations
	has_many :follows
	has_many :tag_lists
	has_many :alerts
	has_many :organization_links
	has_many :tags, through: :tag_lists
	has_many :users, through: :admins
	has_many :counterparts, through: :donations
  belongs_to :city
  
	validates :description, :category,
	  presence: true
	validates :name,
	  presence: true,
	  uniqueness: true
	validates :siret, 
	  presence: true, if: :company?,
	  uniqueness: true,
	  format: { with: /\A\d{14}\z/i}
	validates :RNA,
	  presence: true, if: :association?,
	  uniqueness: true,
    format: { with: /\A[w]\d{9}\z/i}
  validates :logo_url,
    presence: true,
    format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }



# Il faut être administrateur d'une page pour pouvoir créer un projet.
# Ainsi, la méthode (is_creating_project_permitted) est notre test administrateur pour une association.
# La méthode (is_organization_admin) est le test d'administration de l'user pour une entreprise ou une association.

	def association?
		return true if self.is_association == true
	end

	def company?
		return true if self.is_company == true
	end

	def is_creating_project_permitted(user)
		if self.is_association == true && self.is_admin(user) && !user.nil?
			return true
		end
	end

	def is_admin(user)
		self.user_ids.include?(user.id) if !user.nil?	
	end

	def is_organization_admin(user)
		if self.is_admin(user) && !user.nil?
			return true
		end
	end

end
