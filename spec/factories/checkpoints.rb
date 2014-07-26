require 'faker'

FactoryGirl.define do
  factory :checkpoints do
    association :location
    association :quest
    location {Faker::Address.city}
    step_num { rand(1..10) }
    instructions {Faker::Lorem.paragraph}
  end
end