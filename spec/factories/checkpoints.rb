require 'faker'

FactoryGirl.define do
  factory :checkpoints do
    association :location
    association :quest
    location {Faker::Address.city}
    step_num {"1"}
    email {Faker::Name.email}
    encrypted_password {Faker::Internet.password(10)}
  end
end