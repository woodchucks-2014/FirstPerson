module PushHelper
  require 'json'

  def format(params)
    params["checkin"] = JSON.parse(params["checkin"])
    params["user"] = JSON.parse(params["user"])
    params
  end

	def parse_foursquare_json
  end

end
