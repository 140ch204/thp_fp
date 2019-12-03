class Donation < ApplicationRecord
	belongs_to :counterpart
	belongs_to :organization
end
