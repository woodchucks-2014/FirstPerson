require 'faker'

FactoryGirl.define do
  factory :user_checkpoint do
    association :checkpoint
    association :user
    completed {true}
  end
end