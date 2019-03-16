class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
    add_index :tags, :category_id
    add_index :tags, %i[object_type object_id]
  end
end
