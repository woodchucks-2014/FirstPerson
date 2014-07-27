require 'faker'

FactoryGirl.define do
  factory :location do
    latitude {(Faker::Address.latitude).to_f}
    longitude {(Faker::Address.longitude).to_f}
    name {Faker::Commerce.product_name}
    venue_type {Faker::Company.name}
    address {"#{Faker::Address.street_address} #{Faker::Address.city}, New York, NY 12345"}
  end
end
