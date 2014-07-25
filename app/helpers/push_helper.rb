module PushHelper
  require 'json'

  def format(params)
    params["checkin"] = JSON.parse(params["checkin"])
    params["user"] = JSON.parse(params["user"])
    params
  end

	def parse_foursquare_json(params)
    fouresquare_params = {user: nil, location: nil}

    fouresquare_params[:user][:user_id] = User.find_by(params["user"]["id"]).id,

    fouresquare_params[:location][:firstname] = params["user"]["firstname"],
    fouresquare_params[:location][:lastname] = params["user"]["lastname"],
    fouresquare_params[:location][:gender] = params["user"]["gender"],

    fouresquare_params
  end

end

#     t.integer  "location_id"
#     t.integer  "user_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
