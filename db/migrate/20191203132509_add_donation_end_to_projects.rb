class AddDonationEndToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :donation_end, :datetime
  end
end
