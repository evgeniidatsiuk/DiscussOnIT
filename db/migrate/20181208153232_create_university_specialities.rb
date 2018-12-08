class CreateUniversitySpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :university_specialities do |t|
      t.integer :university_id
      t.integer :speciality_id

      t.timestamps
    end
  end
end
