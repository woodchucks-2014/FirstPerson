class UsersController < ApplicationController
  include UsersHelper
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
    current_user
    @checkins = User.user_all_checkins(@user)
    render json: @checkins
  end


  def checkin_points
    current_user
    @checkins = User.checkin_points_all(@user)
    @hash = build_hash(@checkins)
    render json: @hash
  end

  def index
  end

end
