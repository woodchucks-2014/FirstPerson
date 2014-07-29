class UsersController < ApplicationController

  def checkin_points
    user = User.where(id: session[:user_id]).first || User.new
    @checkins = user.check_ins
    @hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
      marker.lat checkin.location.latitude
      marker.lng checkin.location.longitude
      marker.infowindow "Hello"
    end
    render json: @hash
  end

  def admin_checkin
  	api = Fsqr.new(session[:token])
  	api.checkin
  	redirect_to root_path
  end

  def test_login
    session[:user_id] = 2 # artificial login for testing purposes
    redirect_to root_path
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def index
    current_user2
  end

end
