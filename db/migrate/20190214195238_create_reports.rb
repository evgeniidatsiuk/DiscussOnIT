class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :user_email
      t.string :text
      t.string :photos

      t.timestamps
    end
  end
end
