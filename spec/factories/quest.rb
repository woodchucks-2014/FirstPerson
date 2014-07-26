
require 'faker'

FactoryGirl.define do
  factory :quest do    
    association :creator
    category {Faker::Lorem.words(1)}
    start_date {"#{Time.now}"}
    end_date {"#{Time.now}"}
    title {Faker::Lorem.words(2)}
  end
end