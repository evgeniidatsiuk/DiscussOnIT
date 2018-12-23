class CreateUniversitySpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :university_specialties do |t|
      t.integer :university_id
      t.integer :specialty_id

      t.timestamps
    end
  end
end
