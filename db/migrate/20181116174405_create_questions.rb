class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :name
      t.string :text
      t.integer :view, default: 0
      t.integer :right_answer_id

      t.timestamps
    end
  end
end
