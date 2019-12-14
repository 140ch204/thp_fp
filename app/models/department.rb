class Department < ApplicationRecord
	belongs_to :country
  has_many :cities
  validates :department_name,
    presence: true,
    format: { with: /\A[a-z]*\D*\z/i }
  validates :zip_code,
    presence: true,
    format: { with: /\A\d{2}\z/i }
end
