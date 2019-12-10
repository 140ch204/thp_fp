class Country < ApplicationRecord
  has_many :departments
  validates :country_name,
    presence: true,
    format: { with: /\A[a-z]*\z/i }
end
