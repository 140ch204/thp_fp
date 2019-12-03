class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :city, index: true

      t.string :name
      t.text :description
      t.string :logo_url
      t.datetime :starting_date
      t.integer :donation_targeted

      t.timestamps
    end
  end
end
