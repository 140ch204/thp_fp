class CreateDepartments < ActiveRecord::Migration[5.2]
	def change
		create_table :departments do |t|

			t.string :department_name
			t.string :zip_code
			t.string :region

			t.timestamps
		end
		add_belongs_to :cities, :department, index: true
	end
end
