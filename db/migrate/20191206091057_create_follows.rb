class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.boolean :is_following

      t.timestamps
    end
    add_belongs_to :follows, :user, index: true
    add_belongs_to :follows, :organization, index: true
  end
end
