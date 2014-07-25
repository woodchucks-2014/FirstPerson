class UsersController < ApplicationController
  def checkin_points
    points = {}
    user = User.where(id: session[:user_id]).first || User.new
    user.check_ins.each_with_index do |checkin, i|
      points[i] = [checkin.location.latitude, checkin.location.longitude]
    end
    return points.to_json
  end
end
