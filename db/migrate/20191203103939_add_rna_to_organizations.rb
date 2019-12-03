class AddRnaToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :RNA, :string
  end
end
