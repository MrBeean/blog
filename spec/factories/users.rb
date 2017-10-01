FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    avatar { Faker::Avatar.image }
    info { Faker::Lorem.sentence(3) }

    # Коллбэк — после фазы :build записываем поля паролей, иначе Devise не
    # позволит создать юзера
    after(:build) { |u| u.password_confirmation = u.password = "123456"}
  end
end
