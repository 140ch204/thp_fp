class CreateOrganizationLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_links do |t|
      t.string :url_organization
      t.belongs_to :organization, index: true

      t.timestamps
    end
  end
end
