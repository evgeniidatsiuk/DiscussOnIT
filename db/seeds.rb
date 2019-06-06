AdminUser.create!(email: 'zheka@example.com', password: 'password', password_confirmation: 'password') if Rails.env.production?
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
