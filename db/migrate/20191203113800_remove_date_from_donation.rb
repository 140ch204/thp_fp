class RemoveDateFromDonation < ActiveRecord::Migration[5.2]
  def change
    remove_column :donations, :date, :datetime
  end
end
