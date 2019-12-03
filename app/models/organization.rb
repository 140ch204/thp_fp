class Organization < ApplicationRecord
	has_many :admins
	has_many :projects
	has_many :donations
	has_many :users, through: :admins
	has_many :counterparts, through: :donations
	belongs_to :city
end
