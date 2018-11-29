class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
