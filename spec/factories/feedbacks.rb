FactoryGirl.define do

  factory :feedback, class: Feedback do
    name { "Anonymous_#{rand(2000)}" }
    email { Faker::Internet.safe_email }
    message { Faker::Lorem.paragraphs }

    association :user
  end
end