class CreateCities < ActiveRecord::Migration[5.2]
	def change
		create_table :cities do |t|
			t.belongs_to :department, index: true
			
			t.string :city_name

			t.timestamps
		end
	end
end
