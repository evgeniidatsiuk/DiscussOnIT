class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :action
      t.integer :object_id
      t.string :object_type
      t.integer :activeuser_id

      t.timestamps
    end
  end
end
