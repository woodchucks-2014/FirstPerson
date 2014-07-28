require 'faker'

FactoryGirl.define do
  factory :reward do
    association :quest
    description {Faker::Lorem.sentences}
  end
end