class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.int :donation_amount
      t.datetime :date

      t.timestamps
    end
  end
end
