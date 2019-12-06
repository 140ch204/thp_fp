class Donation < ApplicationRecord
	belongs_to :counterpart, optional: true
	belongs_to :organization
  belongs_to :project
  validates :donation_amount, numericality: true, presence: true
end
