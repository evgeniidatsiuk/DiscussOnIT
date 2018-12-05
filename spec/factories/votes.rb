FactoryBot.define do
  factory :vote do
    user_id { 1 }
    object_type { "MyString" }
    object_id { 1 }
    score { 1 }
  end
end
