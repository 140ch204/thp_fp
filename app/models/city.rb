class City < ApplicationRecord
	belongs_to :department
	has_many :users
	has_many :projects
	has_many :organizations
  has_many :alerts
  validates :city_name, 
    presence: true
end
