FactoryBot.define do
  factory :notification do
    user_id { 1 }
    action { "MyString" }
    object_id { 1 }
    object_type { "MyString" }
    activeuser_id { 1 }
  end
end
