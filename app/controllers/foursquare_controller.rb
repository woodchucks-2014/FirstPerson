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
    ## This smells, Maybe have the User class have a #create_from_foursquare method?
    if user
      session[:user_id] = user.id
      session[:token] = token.token
    else
      @user = User.new
      user_creator
      @user.save
      session[:user_id] = @user.id
      session[:token] = token.token
    end
    redirect_to root_path
  end

  def map

  end

  def pull
    parsed_params = parse_foursquare_json(format(params))

    loc = location_creator(parsed_params)
    loc.save
    checkin = checkin_creator(loc, parsed_params)
    checkin.save
    render plain: "200 OK"
  end

  private

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

  private

  def checkin_creator(location, params)
    checkin = CheckIn.new
    checkin.user_id = params[:user][:user_id]
    checkin.location_id = location.id
    checkin
  end

  def location_creator(params)
    # there has to be a better way to do this...
    # We should try to get strong params working with this method
    location = Location.new
    # location.name = params[:location][:name]
    # location.venue_type = params[:location][:venue_type]
    # location.venue_type = params[:location][:second_type]
    # location.latitude = params[:location][:latitude]
    # location.longitude = params[:location][:longitude]
    # location.street= params[:location][:street]
    # location.city = params[:location][:city]
    # location.state = params[:location][:state]
    # location.zip = params[:location][:zip]
    # location.country = params[:location][:country]
    # location.foursquare_id = params[:location][:foursquare_id]

    fields = [:name, :venue_type, :second_type, :latitude, :longitude, :street, :city, :state, :zip, :country, :foursquare_id]
    fields.each { |field| location[field] = params[field]}

    location
  end

end
