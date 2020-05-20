FactoryBot.define do
  factory :job_application do
    vacuancy_job { nil }
    user { nil }
    comment { "Olha o comentario padrão" }
  end
end
