class Donation < ApplicationRecord
	belongs_to :counterpart
	belongs_to :organization
	belongs_to :project
end
