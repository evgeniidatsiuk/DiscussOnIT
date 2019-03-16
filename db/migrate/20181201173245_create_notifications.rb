class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :action
      t.integer :object_id
      t.string :object_type
      t.integer :activeuser_id
      t.datetime :read_at
      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, %i[object_id object_type]
    add_index :notifications, :activeuser_id
  end
end
