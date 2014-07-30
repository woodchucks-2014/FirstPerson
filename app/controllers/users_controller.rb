class UsersController < ApplicationController
  include UsersHelper
  include BuildHashHelper

  #User Info

  def profile
  end

  def xp
    @quests = Quest.user_completed_quests(current_user)
    @checkins = current_user.check_ins
    render partial: "users/xp"
  end

  # def class_user
  # end

  # def inventory
  # end

  # def stats
  # end

  def board
    @users = User.sort_users
    render partial: "users/leaderboard"
  end

  # Session Methods

  def index
    if logged_in?
      render 'maps/show'
    else
      render 'users/home'
    end
  end

  # Greg said this was not necessary anymore
  # def admin_checkin
  # 	api = Fsqr.new(session[:token])
  # 	api.checkin
  # 	redirect_to root_path
  # end

  def test_login
    session[:user_id] = 2 # artificial login for testing purposes
    redirect_to root_path
  end

  def logout
    session.clear
    redirect_to root_path
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
