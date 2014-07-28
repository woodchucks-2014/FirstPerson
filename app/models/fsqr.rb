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
    user = User.find_by(foursquare_id: self.client.user("self")[:id].to_i)
  end
end
