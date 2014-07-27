class UsersController < ApplicationController

  def checkin_points
    user = User.find(session[:user_id]) || User.new
    @checkins = user.check_ins.include(:location)
    @hash = Gmaps4rails.build_markers(@checkin) do |checkin, marker|
      marker.lat checkins.location.latitude
      marker.lng checkins.location.longitude
      marker.infowindow ""#my_marker_obj.name
    end
    render json: @hash
  end

  def admin_checkin
  	api = Fsqr.new(session[:token])
  	api.checkin
  	redirect_to root_path
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
