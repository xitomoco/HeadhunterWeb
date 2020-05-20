FactoryBot.define do
  factory :vacuancy_job do
    title { 'Jornalismo de BNN' }
    description { 'Criar materiar sobre BNN' }
    ability_description { 'Entrega rapida' }
    initial_salary { '1000' }
    end_salary { '1800' }
    level { 'Estágio' }
    limit_date { 5.days.from_now }
    addresse { 'Rua das petalas N21' }
    user { nil }
  end
end
