FactoryBot.define do
  factory :user do
    name { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
    lastname { Faker::Name.initials }
    firstname { Faker::Name.initials }
  end
end
