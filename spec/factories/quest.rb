
require 'faker'

FactoryGirl.define do
  factory :quest do
    # association :creator
    creator_id {1}
    category {'Bar Crawl'}
    description {'Drinking and Cameraderie'}
    user_limit {rand (1..10)}
    start_date {'2014-08-06 18:50:04 -0400'}
    end_date {'2014-08-06 21:50:04 -0400'}
    title {"Vic's 26th Birthday"}
    xp {500}
  end
end
