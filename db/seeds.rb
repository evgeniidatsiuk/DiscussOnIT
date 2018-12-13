# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
University.create!(name: 'УжНУ', location: 'Ужгород', desc: 'Навчальний заклад де я навчаюсь на все інше мені чесно кажучи побарабану')
University.create!(name: 'УжНУ2', location: 'НЕ Ужгород', desc: 'Навчальний заклад де не я навчаюсь на все інше мені чесно кажучи побарабану')
University.create!(name: 'УжНУ3', location: 'на Ужгород', desc: 'Навчальний заклад де не я навчаюсь на все інше мені чесно кажучи побарабану')
Specialty.create!(name: 'Spec1')
Specialty.create!(name: 'SPec2')
UniversitySpecialty.create!(university_id: 1, specialty_id: 1)
UniversitySpecialty.create!(university_id: 1, specialty_id: 2)
UniversitySpecialty.create!(university_id: 2, specialty_id: 1)
UniversitySpecialty.create!(university_id: 3, specialty_id: 2)
