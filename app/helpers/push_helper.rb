module PushHelper
  require 'json'

  def format(params)
    formatted_params = {}
    formatted_params["checkin"] = JSON.parse(params["checkin"])
    formatted_params["user"] = JSON.parse(params["user"])
    formatted_params
  end

	def parse_foursquare_json(formatted_params)
    foursquare_params = {user: {}, location: {}}

    foursquare_params[:user][:user_id] = User.find_by(foursquare_id: formatted_params["user"]["id"].to_i).id
    foursquare_params[:location][:name] = formatted_params["checkin"]["venue"]["name"]
    foursquare_params[:location][:venue_type] = formatted_params["checkin"]["venue"]["categories"].first["name"]
    foursquare_params[:location][:second_type] = formatted_params["checkin"]["venue"]["categories"].last["name"]
    foursquare_params[:location][:latitude] = formatted_params["checkin"]["venue"]["location"]["lat"].to_f
    foursquare_params[:location][:longitude] = formatted_params["checkin"]["venue"]["location"]["lng"].to_f
    foursquare_params[:location][:street] = formatted_params["checkin"]["venue"]["location"]["address"]
    foursquare_params[:location][:city] = formatted_params["checkin"]["venue"]["location"]["city"]
    foursquare_params[:location][:state] = formatted_params["checkin"]["venue"]["location"]["state"]
    foursquare_params[:location][:zip] = formatted_params["checkin"]["venue"]["location"]["postalCode"]
    foursquare_params[:location][:country] = formatted_params["checkin"]["venue"]["location"]["cc"]
    foursquare_params[:location][:foursquare_id] = formatted_params["checkin"]["venue"]["id"]

    foursquare_params
  end

end
