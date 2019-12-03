class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :logo_url
      t.int :siret
      t.boolean :is_association
      t.boolean :is_company

      t.timestamps
    end
  end
end
