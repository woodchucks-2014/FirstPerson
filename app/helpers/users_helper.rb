module UsersHelper

  def user_params
    user_stuff = {}
    user_stuff[:foursquare_id] = params["user"]["id"],
    user_stuff[:photo_url] = params["user"]["photo"][prefix] + params["user"]["photo"]["suffix"]

    user_stuff[:firstname] = params["user"]["firstname"],
    user_stuff[:lastname] = params["user"]["lastname"],
    user_stuff[:gender] = params["user"]["gender"],
    user_stuff.require("user").permit(:firstname, :lastname, :gender, :photo_url, :foursquare_id)
  end

end
