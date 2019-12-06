class CreateCities < ActiveRecord::Migration[5.2]
	def change
		create_table :cities do |t|
			
			t.string :city_name

			t.timestamps
		end
		add_belongs_to :users, :city, index: true
		add_belongs_to :organizations, :city, index: true
		add_belongs_to :projects, :city, index: true
	end
end
