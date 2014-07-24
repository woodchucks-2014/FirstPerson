class Foursquare
  attr_accessor :client
  def initialize(token)
    @client = Foursquare2::Client.new(:oauth_token => token)
  end

end
