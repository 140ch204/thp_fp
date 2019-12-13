class ProjectLink < ApplicationRecord
	belongs_to :project

	validates :url_project,
		presence: {message: "doit être fourni"},
		format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }

	validates :url_name,
		presence: true
end
