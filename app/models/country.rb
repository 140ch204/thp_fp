class Country < ApplicationRecord
  has_many :departments
  validates :country_name,
    presence: true
end
