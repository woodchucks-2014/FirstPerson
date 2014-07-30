require 'rails_helper'
require 'haversine'
require 'chronic'

RSpec.describe CheckInsHelper, :type => :helper do
  it "calculates distance between locations accurately using calc_distance method" do
  	lat1 = 30
  	long1 = 30
  	lat2 = 60
  	long2 = 60
  	expect(calc_distance(lat1, long1, lat2, long2)).to eq(4013890.1135788984)
  end

  it "calculates #distance_since_last_checkin accurately" do
  #   quest = FactoryGirl.create(:quest)
  #   user = FactoryGirl.create(:user)
  #   user_quest = FactoryGirl.create(:user_quest)
  #   location1 = FactoryGirl.create(:location, latitude: 30, longitude: 30)
		# location2 = FactoryGirl.create(:location, latitude: 60, longitude: 60)
		# checkins = [location1, location2]
  #   puts "\n\n****\n\ncalc dist #{calc_distance(checkins[0].latitude, checkins[0].longitude, checkins[1].latitude, checkins[1].longitude)}\n\n****\n\n"
		# expect().to eq()
	end
end