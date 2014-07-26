module PushHelper
  require 'json'

  def format(fields)
    formatted_fields = {}
    formatted_fields["checkin"] = JSON.parse(fields["checkin"])
    formatted_fields["user"] = JSON.parse(fields["user"])
    formatted_fields
  end

	def parse_foursquare_json(fields)
    #user, checkins
    foursquare_fields = {user: {}, location: {}}

    foursquare_fields[:user][:user_id] = User.find_by(foursquare_id: fields["user"]["id"].to_i).id
    foursquare_fields[:location][:name] = fields["checkin"]["venue"]["name"]
    foursquare_fields[:location][:venue_type] = fields["checkin"]["venue"]["categories"].first["name"]
    foursquare_fields[:location][:latitude] = fields["checkin"]["venue"]["location"]["lat"].to_f
    foursquare_fields[:location][:longitude] = fields["checkin"]["venue"]["location"]["lng"].to_f
    foursquare_fields[:location][:address] = fields["checkin"]["venue"]["location"]["formattedAddress"].join(" , ")

    foursquare_fields
  end

end
