FactoryBot.define do
  factory :comment_of_proposal do
    vacuancy_job { nil }
    user { nil }
    comment { "Sim to afim" }
    status { 0 }
  end
end
