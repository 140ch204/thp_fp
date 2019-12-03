class CreateCounterparts < ActiveRecord::Migration[5.2]
  def change
    create_table :counterparts do |t|
      t.string :name
      t.int :price

      t.timestamps
    end
  end
end
