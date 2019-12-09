class Tag < ApplicationRecord
	has_many :tag_lists
	has_many :organizations, through: :tag_lists

	TAG_LIST = Tag.all
	
end
