require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:creator] do

    firstname {'Vic'}
    lastname {'Schaeperkoetter'}
    gender {"male"}
    email {"vjs3@gmail.com"}

    # foursquare_id { rand(1..10) }

    # category {Faker::Lorem.words(1)}
    # start_date {"#{Time.now}"}
    # end_date {"#{Time.now}"}
    # title {Faker::Lorem.words(2)}

    # name {Faker::Name.name}
    # email {Faker::Name.email}
    # encrypted_password {Faker::Internet.password(10)}
  end
end
