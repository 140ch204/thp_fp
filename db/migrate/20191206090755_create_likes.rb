class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :is_liking

      t.timestamps
    end
    add_belongs_to :likes, :user, index: true
    add_belongs_to :likes, :organization, index: true    
  end
end
