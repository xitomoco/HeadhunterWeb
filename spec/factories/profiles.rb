FactoryBot.define do
  factory :profile do
    name { "Carlos da Silva" }
    social_name { "Carlinhos" }
    date_of_birth { "05/05/1995" }
    formations { "Advocacia" }
    xp { "Assisti suits completo" }
    user
  end
end
