module PushHelper
  require 'json'

  def format(params)
    params["checkin"] = JSON.parse(params["checkin"])
    params["user"] = JSON.parse(params["user"])
    params
  end

	def parse_foursquare_json
    checkin_params = {}
    checkin_params[:foursquare_id] = params["user"]["id"],
    checkin_params[:photo_url] = params["user"]["photo"][prefix] + params["user"]["photo"]["suffix"]

    checkin_params[:firstname] = params["user"]["firstname"],
    checkin_params[:lastname] = params["user"]["lastname"],
    checkin_params[:gender] = params["user"]["gender"],
    checkin_params.require("user").permit(:firstname, :lastname, :gender, :photo_url, :foursquare_id)
  end

end
