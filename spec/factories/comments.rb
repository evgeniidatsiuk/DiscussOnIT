FactoryBot.define do
  factory :comment do
    object_type { "MyString" }
    object_id { 1 }
    user_id { 1 }
    text { "MyString" }
  end
end
