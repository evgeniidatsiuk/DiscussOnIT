class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :text
      t.integer :user_id
      t.integer :view, default: 0
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
