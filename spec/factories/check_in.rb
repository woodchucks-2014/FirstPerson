require 'faker'

FactoryGirl.define do
  factory :check_in do
    association :location
    association :user
  end
end