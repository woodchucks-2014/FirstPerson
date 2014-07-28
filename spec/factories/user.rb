require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:creator] do

    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    gender {"male"}
    email {Faker::Internet.email}

    foursquare_id { rand(1..100) }

    encrypted_password {Faker::Internet.password(10)}
  end
end
