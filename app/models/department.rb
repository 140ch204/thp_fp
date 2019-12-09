class Department < ApplicationRecord
	belongs_to :country
  has_many :cities
  validates :department_name,
    presence: true
end
