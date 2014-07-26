class FoursquareController < ActionController::Base

layout "application"
include AuthHelper
include PushHelper
include UsersHelper

  def index
    redirect_to auth_uri
  end

  def redirect
    token = token_receipt
    @api = Fsqr.new(token.token)
    user = User.find_by(foursquare_id: @api.client.user("self")[:id].to_i)
    if user
      session[:user_id] = user.id
    else
      @user = User.new
      user_creator
      @user.save
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  def map

  end

  def pull
    @params = params
    
    render plain: "200 OK" 
 end

  def testpush
  	render json: {lat: 53.385873, long: -1.471471}
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    user_stuff.require("user").permit(:firstname, :lastname, :gender, :photo_url, :foursquare_id)
  end

end
