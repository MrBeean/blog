FactoryBot.define do
  factory :user do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    info      { Faker::Lorem.sentences }
    password  { Faker::Number.number(10) }
  end
end