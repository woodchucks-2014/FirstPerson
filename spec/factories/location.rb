require 'faker'

FactoryGirl.define do
  factory :location do
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
    name {Faker::Commerce.product_name}
    venue_type {Faker::Company.name}
    address {"#{Faker::Address.street_address} #{Faker::Address.city}, New York, NY 12345"}
  end
end