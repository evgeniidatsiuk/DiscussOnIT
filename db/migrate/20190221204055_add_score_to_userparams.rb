class AddScoreToUserparams < ActiveRecord::Migration[5.1]
  def change
    add_column :userparams, :score, :integer, default: 0
  end
end
