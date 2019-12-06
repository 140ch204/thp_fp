class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :is_liking

      t.timestamps
    end
  end
  add_belongs_to :users, :like, index: true
  add_belongs_to :projects, :like, index: true
end
