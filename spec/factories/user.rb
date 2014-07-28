require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:creator] do

    firstname {'Vic'}
    lastname {'Schaeperkoetter'}
    gender {"male"}
    email {"vjs3@gmail.com"}

    foursquare_id { 100 }

    encrypted_password {Faker::Internet.password(10)}
  end
end
