module UsersHelper

  def user_creator
    @user.foursquare_id = @api.client.user("self")[:id]
    @user.photo_url = @api.client.user("self")[:photo][:prefix] + @api.client.user("self")[:photo][:suffix]
    @user.firstname = @api.client.user("self")[:firstName]
    @user.lastname = @api.client.user("self")[:lastName]
    @user.gender =@api.client.user("self")[:gender]
  end

  def current_user22
  	@user = User.where(id: session[:user_id]).first || User.new
  end

  def logged_in?
  	session[:user_id] != nil
  end

end
