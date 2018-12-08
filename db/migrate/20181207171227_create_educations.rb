class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.integer :userparam_id
      t.integer :university_specialty_id
      t.integer :begind_year
      t.integer :end_year

      t.timestamps
    end
  end
end
