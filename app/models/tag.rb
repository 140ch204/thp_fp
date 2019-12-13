class Tag < ApplicationRecord
	has_many :tag_lists
	has_many :organizations, through: :tag_lists
	
end
