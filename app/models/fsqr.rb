class Fsqr
  attr_accessor :client

  def initialize(token)
    @client = Foursquare2::Client.new(oauth_token: token, api_version: '20140724')
  end

  def rand_loc
  	string = []
	  2.times do
	  	string << (rand(1) * 179).to_s
	  end
	 string.join(',')
  end

  def checkin
  	self.client.add_checkin(ll: self.rand_loc)
  end

end
