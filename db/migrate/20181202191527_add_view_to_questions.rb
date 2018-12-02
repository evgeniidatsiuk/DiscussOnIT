class AddViewToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :view, :integer, default: 0
  end
end
