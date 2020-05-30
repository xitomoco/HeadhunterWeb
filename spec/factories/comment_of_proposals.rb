FactoryBot.define do
  factory :comment_of_proposal do
    vacuancy_job { nil }
    user { nil }
    commet { "MyString" }
    status { 1 }
  end
end
