class Donation < ApplicationRecord
	belongs_to :counterpart, optional: true
	belongs_to :organization
	belongs_to :project
end
