class CreateCountries < ActiveRecord::Migration[5.2]
	def change
		create_table :countries do |t|

			t.string :country_name

			t.timestamps
		end
		add_belongs_to :departments, :country, index: true
	end
end
