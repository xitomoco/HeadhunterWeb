FactoryBot.define do
  factory :user do
    email { 'candidate1@rspec.com' }
    password { '1234567' }
    role { 'candidate' }
  end
end
