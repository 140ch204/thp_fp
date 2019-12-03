class CreateCounterparts < ActiveRecord::Migration[5.2]
	def change
		create_table :counterparts do |t|
			t.belongs_to :project, index: true


			t.string :name
			t.integer :price

			t.timestamps
		end
	end
end
