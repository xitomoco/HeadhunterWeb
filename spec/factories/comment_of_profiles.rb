FactoryBot.define do
  factory :comment_of_profile do
    user { nil }
    profile { nil }
    comment { "MyString" }
  end
end
