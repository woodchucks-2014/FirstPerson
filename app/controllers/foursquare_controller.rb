class FoursquareController < ActionController::Base

  layout "application"

  include AuthHelper
  include PushHelper
  include UsersHelper
  include QuestsHelper


  def index
    redirect_to auth_uri
  end

  def redirect
    @token = token_receipt.token
    @api = Fsqr.new(@token)
    @user = @api.get_by_foursquare_id
    unless @user
      @user = user_creator
    end
    set_session
    redirect_to root_path
  end

  def map

  end

  def pull
    foursquare_params = parse_foursquare_json(format(params))
    location = location_creator(foursquare_params)
    user_id = foursquare_params[:user][:user_id]
    checkin = checkin_creator(location, user_id)
    user = User.find(user_id)
    user_checkpoint_check(user, location)
    render plain: "200 OK" if location && user_id
  end

  private

  def set_session
    session[:user_id] = @user.id
    session[:token] = @token
  end

  def checkin_params(location, params)
    checkin_info = {}
    checkin_info[:user_id] = params[:user][:user_id]
    checkin_info[:location_id] = location.id
    checkin_info.require("CheckIn").permit(:user_id, :location_id)
  end

  def location_params(params)
    location_info = params[:location]
    location_info.require("location").permit(:name, :venue_type, :latitude, :longitude, :address)
  end

  def checkin_creator(location, user_id)
    checkin = CheckIn.new
    checkin.user_id = user_id
    checkin.location_id = location.id
    checkin.save
  end

  def location_creator(params)
    location = Location.find_by(foursquare_id: params[:location][:foursquare_id]) 
    unless location
      location = Location.new
      fields = [:name, :venue_type, :second_type, :latitude, :longitude, :street, :city, :state, :zip, :country, :foursquare_id]
      fields.each { |field| location[field] = params[:location][field]}
      location.save
    end
    location
  end

end
