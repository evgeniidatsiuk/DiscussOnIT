class AddRightAnswerIdToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :right_answer_id, :integer
  end
end
