class AddMasterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :master, :boolean, default: false
  end
end
