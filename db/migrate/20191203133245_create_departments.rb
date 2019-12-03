class CreateDepartments < ActiveRecord::Migration[5.2]
	def change
		create_table :departments do |t|
			t.belongs_to :country, index: true

			t.string :department_name
			t.string :zip_code
			t.string :region

			t.timestamps
		end
	end
end
