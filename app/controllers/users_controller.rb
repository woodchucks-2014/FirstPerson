class UsersController < ApplicationController
  include UsersHelper
  include BuildHashHelper

  def index
    if logged_in?
      render 'maps/show'
    else
      render 'users/home'
    end
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

  def profile
  end

  def user_all_checkins_loc
    current_user
    checkins = build_checkpoints_hash(@user.check_ins)
    render json: checkins
  end

  def checkin_points
    checkins = build_checkpoints_hash(CheckIn.all)
    render json: checkins
  end


end
