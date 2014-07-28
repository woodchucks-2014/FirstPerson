
require 'faker'

FactoryGirl.define do
  factory :quest do
    association :creator 
    category {Faker::Commerce.department}
    description {Faker::Company.catch_phrase}
    user_limit {rand (1..10)}
    start_date {Time.now}
    end_date {Time.now+30}
    title {Faker::Company.catch_phrase}
    xp {500}
  end
end
