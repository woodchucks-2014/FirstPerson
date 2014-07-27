class UsersController < ApplicationController

  def checkin_points
    user = User.where(id: session[:user_id]).first || User.new
    @checkins = user.check_ins#.include(:locations)
    @hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
      marker.lat checkin.location.latitude
      marker.lng checkin.location.longitude
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
