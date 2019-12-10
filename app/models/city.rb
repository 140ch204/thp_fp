class City < ApplicationRecord
	belongs_to :department, optional: true
	has_many :users
	has_many :projects
	has_many :organizations
  has_many :alerts
  validates :city_name, 
    presence: true,
    format: { with: /\A[a-z]*|\D*\z/i }
end
