class Project < ApplicationRecord
	belongs_to :organization
	belongs_to :city
	has_many :counterparts
	has_many :donations, through: :organizations
	has_many :donations, through: :counterparts
	has_many :admins, through: :organizations
end
