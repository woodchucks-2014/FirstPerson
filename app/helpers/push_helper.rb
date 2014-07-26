module PushHelper
  require 'json'

  def format(fields)
    fields["checkin"] = JSON.parse(params["checkin"])
    fields["user"] = JSON.parse(params["user"])
    fields
  end

	def parse_foursquare_json(fields)
    foursquare_fields = {user: {}, location: {}}

    foursquare_fields[:user][:user_id] = User.find_by(foursquare_id: fields["user"]["id"]).id

    foursquare_fields[:location][:name] = fields["venue"]["gender"]
    foursquare_fields[:location][:venue_type] = fields["venue"]["categories"]["name"]
    foursquare_fields[:location][:latitude] = fields["venue"]["location"]["lat"]
    foursquare_fields[:location][:longitude] = fields["venue"]["location"]["lng"]
    foursquare_fields[:location][:address] = fields["venue"]["location"]["formattedAddress"].join(" , ")

    foursquare_fields
  end

end
