FactoryGirl.define do
  factory :user, class: User do
    name { Faker::StarWars.character }
    email { Faker::Internet.safe_email }
    info { Faker::Lorem.sentences(1) }

    after(:build) { |user| user.password_confirmation = user.password = 'testtest' }
  end
end