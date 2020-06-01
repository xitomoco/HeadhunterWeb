FactoryBot.define do
  factory :vacuancy_job do
    title { 'Jornalismo de BNN' }
    description { 'Criar materiar sobre BNN' }
    ability_description { 'Entrega rapida' }
    initial_salary { '1000' }
    end_salary { '1800' }
    level { 'Estágio' }
    limit_date { '30-12-2028' }
    addresse { 'Rua das petalas N21' }
    user { nil }
    status { 0 }
  end
end
