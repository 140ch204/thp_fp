class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :logo_url
      t.datetime :starting_date
      t.int :donation_targeted

      t.timestamps
    end
  end
end
