require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:creator] do

    firstname {'Vic'}
    lastname {'Schaeperkoetter'}
    gender {"male"}
    email {Faker::Internet.email}

    foursquare_id { rand(1..100) }

    encrypted_password {Faker::Internet.password(10)}
  end
end
