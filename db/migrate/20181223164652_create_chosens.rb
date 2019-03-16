class CreateChosens < ActiveRecord::Migration[5.1]
  def change
    create_table :chosens do |t|
      t.integer :user_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
    add_index :chosens, :user_id
    add_index :chosens, %i[object_id object_type]
  end
end
