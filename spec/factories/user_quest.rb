require 'faker'

FactoryGirl.define do
  factory :user_quest do
    quest_id {"1"}
    user_id {"2"}
    completed {"true"}
  end
end
