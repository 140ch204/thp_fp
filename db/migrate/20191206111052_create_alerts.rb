class CreateAlerts < ActiveRecord::Migration[5.2]
	def change
		create_table :alerts do |t|
			t.belongs_to :organization, index: true
			t.belongs_to :user, index: true
			t.belongs_to :city, index: true
			t.belongs_to :project, index: true

			t.string :alert_name

			t.timestamps
		end
	end
end
