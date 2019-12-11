class OrganizationLink < ApplicationRecord
	belongs_to :organization

	validates :url_organization,
		presence: {message: "doit être fourni"},
		format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

	validates :url_name,
		presence: true,
		format: { with: /\A[a-z]*\z/i }
end
