class AddNicknameToUserparams < ActiveRecord::Migration[5.1]
  def change
    add_column :userparams, :nickname, :string
  end
end
