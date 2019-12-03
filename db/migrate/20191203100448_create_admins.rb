class CreateAdmins < ActiveRecord::Migration[5.2]
	def change
		create_table :admins do |t|
			t.belongs_to :user, index: true
			t.belongs_to :organization, index: true

			t.timestamps
		end
	end
end
