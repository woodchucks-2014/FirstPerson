module PushHelper
  require 'json'

  def format(params)
    params["checkin"] = JSON.parse(params["checkin"])
    params["user"] = JSON.parse(params["user"])
    params
  end

	def parse_foursquare_json(params)
    foursquare_params = {user: nil, location: nil}

    foursquare_params[:user][:user_id] = User.find_by(foursquare_id: params["user"]["id"]).id

    foursquare_params[:location][:name] = params["venue"]["gender"]
    foursquare_params[:location][:venue_type] = params["venue"]["categories"]["name"]
    foursquare_params[:location][:latitude] = params["venue"]["location"]["lat"]
    foursquare_params[:location][:longitude] = params["venue"]["location"]["lng"]
    foursquare_params[:location][:address] = params["venue"]["location"]["formattedAddress"].join(" , ")

    foursquare_params
  end

end
