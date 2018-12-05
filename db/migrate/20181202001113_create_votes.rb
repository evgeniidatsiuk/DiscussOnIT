class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.string :object_type
      t.integer :object_id
      t.integer :score

      t.timestamps
    end
  end
end
