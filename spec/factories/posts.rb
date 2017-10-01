FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    post { Faker::Lorem.paragraph }
    visible { Faker::Boolean.boolean }
    mainimg { Faker::Avatar.image }

    # Связь с юзером
    association :user
  end
end
