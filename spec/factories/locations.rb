require 'faker'

FactoryGirl.define do
  factory :locations do
    latitude {(Faker::Address.latitude).to_f}
    longitude {(Faker::Address.longitude).to_f}
    name "CheckIn1"
    venue_type "checkin_loc1"
    street "48 Wall St"
    city "New York"
    state "NY"
    country "US"
    zip "10005"
  end
end