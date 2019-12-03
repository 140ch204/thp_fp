class AddDonationStartToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :donation_start, :datetime
  end
end
