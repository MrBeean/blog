FactoryGirl.define do
  factory :feedback do
    name { "Anonymous#{rand(100)}" }
    email { Faker::Internet.email }
    message { Faker::Lorem.sentence(3) }

    # Связь с юзером
    association :user
  end
end
