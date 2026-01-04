FactoryBot.define do
  factory :user do
    name { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2020-01-01') }
    lastname { '菊山' }
    firstname { '依吹' }
    lastnamekana { 'キクヤマ' }
    firstnamekana { 'イブキ' }
  end
end
