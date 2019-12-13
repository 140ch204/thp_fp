class OrganizationLink < ApplicationRecord
	belongs_to :organization

	validates :url_organization,
		presence: {message: "doit être fourni"},
		format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }
	validates :url_name,
		presence: true
end
