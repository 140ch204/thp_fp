class CreateCities < ActiveRecord::Migration[5.2]
	def change
		create_table :cities do |t|
			t.belongs_to :department, index: true
			
			t.string :city_name

			t.timestamps
		end
		add_column :users, :city_id, :belongs_to, index: true
		add_column :organizations, :city_id, :belongs_to, index: true
		add_column :projects, :city_id, :belongs_to, index: true
	end
end
