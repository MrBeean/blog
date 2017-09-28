FactoryGirl.define do
  factory :post, class: Post do
    title { Faker::Job.title }
    post { Faker::Lorem.paragraphs }
    visible { Faker::Boolean.boolean }

    association :user
  end
end