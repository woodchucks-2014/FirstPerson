require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:creator] do
    # name {Faker::Name.name}
    # email {Faker::Name.email}
    # encrypted_password {Faker::Internet.password(10)}
  end
end
