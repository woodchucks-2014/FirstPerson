module UsersHelper

  def user_creator
    user = User.new
    user.foursquare_id = @api.client.user("self")[:id]
    user.photo_url = @api.client.user("self")[:photo][:prefix] + @api.client.user("self")[:photo][:suffix]
    user.firstname = @api.client.user("self")[:firstName]
    user.lastname = @api.client.user("self")[:lastName]
    user.gender =@api.client.user("self")[:gender]
    user.email = @api.client.user("self")[:contact][:email]
    user.save
    user
  end

  def current_user
  	@user = User.where(id: session[:user_id]).first || User.new
  end

  def logged_in?
  	session[:user_id] != nil
  end

end
