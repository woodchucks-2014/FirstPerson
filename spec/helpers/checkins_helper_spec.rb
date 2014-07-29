require 'rails_helper'
require 'haversine'

RSpec.describe CheckInsHelper, :type => :helper do
  it "add some examples to (or delete) #{__FILE__}" do
  	lat1 = 30
  	long1 = 30
  	lat2 = 60
  	long2 = 60
  	expect(calc_distance(lat1, long1, lat2, long2)).to eq(4013890.1135788984)
  end
end