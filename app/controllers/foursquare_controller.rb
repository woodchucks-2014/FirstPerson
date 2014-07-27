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

  def search_venues
    query = params[:query]
    ll = params[:ll]
    api = Fsqr.new(session[:token])
    returned_venues = api.client.suggest_completion_venues(query: query, ll: "40.7060974, -74.0092696")
    @venues = {}
    returned_venues["minivenues"].each do |venue|
      @venues[venue["name"]] = 
                            {
                              name: venue["name"],
                              venue_type: venue["categories"]["name"]
                              # latitude: venue["location"]["lat"],
                              # longitude:venue["location"]["lng"],
                              # foursquare_id: venue["id"],
                              # street: venue["location"]["address"],
                              # city: venue["location"]["city"],
                              # state: venue["location"]["state"],
                              # zip: venue["location"]["postalCode"],
                              # country: venue["location"]["country"]
                            }
                          end

    render json: @venues
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
    location = Location.new
    location.name = params[:location][:name]
    location.venue_type = params[:location][:venue_type]
    location.latitude = params[:location][:latitude]
    location.longitude = params[:location][:longitude]
    location.address= params[:location][:address]
    location
  end

end
