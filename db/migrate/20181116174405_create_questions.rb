class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
