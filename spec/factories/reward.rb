require 'faker'

FactoryGirl.define do
  factory :reward do
    association :quest
    xp {500}
  end
end