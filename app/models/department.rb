class Department < ApplicationRecord
	belongs_to :country
  has_many :cities
  validates :department_name,
    presence: true,
    format: { with: /\A[a-z]*|\D*\z/i }
end
