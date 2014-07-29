class Fsqr
  attr_accessor :client

  def initialize(token)
    @client = Foursquare2::Client.new(oauth_token: token, api_version: '20140724')
  end

  def rand_loc
    string = []
    string << (40 + rand(1)).to_s
    string << (-74 + rand(1)).to_s
    string.join(',')
  end

  def checkin
  	self.client.add_checkin(ll: self.rand_loc, broadcast: "public")
  end

  def get_by_foursquare_id
    user = User.find_by(foursquare_id: (self.client.user("self")[:id]).to_i) || nil
  end

  def search(query, ll, location_id)
    returned_venues = self.client.suggest_completion_venues(query: query, ll: ll)
    self.parse_search(returned_venues, location_id)
  end

  def parse_search(returned_venues, location_id)
    venues = {}
    returned_venues["minivenues"].each_with_index do |venue, i|
      venues[i] =
                    {
                      name: venue["name"],
                      venue_type: venue["categories"].first["name"],
                      second_type: venue["categories"].last["name"],
                      latitude: venue["location"]["lat"],
                      longitude:venue["location"]["lng"],
                      foursquare_id: venue["id"],
                      street: venue["location"]["address"],
                      city: venue["location"]["city"],
                      state: venue["location"]["state"],
                      zip: venue["location"]["postalCode"],
                      country: venue["location"]["country"],
                      location_id: location_id #our location id in the database
                    }
    end

  venues
  end
end
