class CreateDonations < ActiveRecord::Migration[5.2]
	def change
		create_table :donations do |t|
			t.belongs_to :counterpart, index: true
			t.belongs_to :organization, index: true
			t.belongs_to :project, index: true

			t.integer :donation_amount
			t.datetime :date

			t.timestamps
		end
	end
end
