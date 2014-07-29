class UsersController < ApplicationController

  include BuildHashHelper

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

  def profile
    @user = User.find(2)
  end

  def user_all_checkins_loc
    @checkins = User.user_all_checkins
    render json: @checkins
  end


  def checkin_points
    @checkins = User.checkin_points_all
    @hash = build_hash(@checkins)
    render json: @hash
  end

end
