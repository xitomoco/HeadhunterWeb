FactoryBot.define do
  factory :comment_of_reject do
    vacuancy_job { nil }
    user { nil }
    comment { "MyString" }
  end
end
