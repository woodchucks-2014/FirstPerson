require 'faker'

FactoryGirl.define do
  factory :user_reward do
    association :reward
    association :user
  end
end