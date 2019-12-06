class Alert < ApplicationRecord
	belongs_to :city, optional: true
	belongs_to :user, optional: true
	belongs_to :organization, optional: true
	belongs_to :project, optional: true
end
