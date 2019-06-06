class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :text
      t.integer :score, default: 0

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end
end
