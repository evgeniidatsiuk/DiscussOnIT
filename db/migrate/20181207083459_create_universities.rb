class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :desc
      t.string :location

      t.timestamps
    end
  end
end
