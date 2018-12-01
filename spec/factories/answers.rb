FactoryBot.define do
  factory :answer do
    user_id { 1 }
    question_id { 1 }
    text { "MyString" }
  end
end
