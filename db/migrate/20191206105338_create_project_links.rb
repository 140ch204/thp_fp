class CreateProjectLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :project_links do |t|
      t.string :url_project
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
