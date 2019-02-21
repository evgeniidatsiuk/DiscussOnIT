class AddScoreToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :score, :integer, default: 0
  end
end
