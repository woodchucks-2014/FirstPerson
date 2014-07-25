module UsersHelper

  def user_hash_helper
    user_stuff = {
    user_stuff[:foursquare_id] = @api.client.user("self")[:id],
    user_stuff[:photo_url] = @api.client.user("self")[:photo][:prefix] + @api.client.user("self")[:photo][:suffix],
    user_stuff[:firstname] = @api.client.user("self")[:firstName],
    user_stuff[:lastname] = @api.client.user("self")[:lastName],
    user_stuff[:gender] = @api.client.user("self")[:gender]
	}
  end

end
