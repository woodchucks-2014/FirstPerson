require 'faker'

FactoryGirl.define do
  factory :user_quest do
    association :quest
    association :user
    completed {true}
  end
end
