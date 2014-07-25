require 'rails_helper'
require 'haversine'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe LocationsHelper, :type => :helper do
#   describe "calculates distance in meters between two locations" do
#   	location1 = Location.create!
#   	location2 = Location.create!
#   	location1.latitude = 30
#   	location1.longitude = 30
#   	location2.latitude = 60
#   	location2.longitude = 60

#   	expect(calc_distance(location1.latitude, location1.longitude, 
#   	location2.latitude, location2.longitude).ceil).to eq(4013891)
#   end
# end