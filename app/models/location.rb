class Location < ActiveRecord::Base
  has_many :checkpoints
  has_many :quests, through: :checkpoints
  has_many :check_ins
  has_many :users, through: :check_ins

  after_validation :add_address
  # geocoded_by :address
  before_create :get_latlng

  private

  def add_address
    self.address = [self.street, self.city, self.state, self.zip].join(', ')
  end

  def get_latlng
    url = "open.mapquestapi.com/geocoding/v1/address"
    request = "?key=" + ENV["MAP_KEY"] + "&location=" + self.address
    response = JSON.parse(Net::HTTP.get_response(url,request))
    puts response["results"]["locations"]["latLng"]
  end
#{"results":[{"locations":[{"latLng":{"lng":-74.009107,"lat":40.706486}
end
