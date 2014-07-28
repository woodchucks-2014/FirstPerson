require 'faker'

FactoryGirl.define do
  factory :reward do
    association :quest
    description {"Yay! You get a reward!"}
  end
end