class QuestsController < ApplicationController

  include UsersHelper
  include BuildHashHelper

  def all
    @user_quest = UserQuest.new
    @quests = Quest.includes(:checkpoints).all.select { |quest| quest.checkpoints.length >= 1  }
    render json: build_quests_hash(@quests)
  end


  def user_accepted_quests_loc
    @quests = Quest.user_accepted_quests(current_user)
    render json: build_hash(@quests)
  end

  def user_created_quests_loc
    @quests = Quest.user_created_quests(current_user)
    render json: build_hash(@quests)
  end

  def user_completed_quests_loc
    @quests = Quest.user_completed_quests(current_user)
    render json: build_hash(@quests)
  end


  def accept_form
    @user_quest = UserQuest.new
    @quest = Quest.find(params[:quest_id])
    render partial: "quests/accept_form", layout: false
  end

  def main
    @quests = Quest.all
    @user_quest = UserQuest.new
    @quest = Quest.new
  end


  def accept
    @user_quest = UserQuest.new(user_quest_params)
    quest_id = params[:user_quest][:quest_id]
    user_id = session[:user_id]
    if @user_quest.save
      quest = Quest.find(quest_id)
      quest.checkpoints.each do |checkpoint|
        UserCheckpoint.create(user_id: user_id, checkpoint_id: checkpoint.id)
      end
      flash[:notice] = "Quest successfully accepted"
      render partial: "quests/accepted", layout: false
    else
      flash[:notice] = "Please try again"
      render partial: "quests/rejected", layout: false
    end

  end


  def create
    @checkpoint = Checkpoint.new
    @quest = Quest.new(quest_params)
    if @quest.save
      render partial: 'quests/quest_loc'
    else
      flash[:notice] = "Please try again"
      render partial: 'quests/rejected'
    end

  end

  def set_location
    params[:location] = params[:checkpoint][:locations]
    @location = Location.new(location_params)
    @location.save

    params[:checkpoint][:location_id] = @location.id

    @checkpoint = Checkpoint.new(checkpoint_params)
    if @checkpoint.save
      render json: search_venues
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end

  def search_venues
    query = @location.name
    ll = [@location.latitude, @location.longitude].join(',')
    api = Fsqr.new(session[:token])
    @venues = api.search(query, ll, @location.id)
  end

  def commit_location
    @location = Location.find(params[:venue][:location_id])
    @location.update(venue_params)
    redirect_to quests_path
  end

  def accepted
  end

  def rejected
  end

  def index
  end

  private


  def checkpoint_params
    params.require(:checkpoint).permit(:instructions, :quest_id, :location_id)
  end

  def user_quest_params
    params[:user_quest][:user_id] = current_user.id #hard code to 1 for local
    params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  end

  def quest_params
    params[:quest][:creator_id] = current_user.id #hard code to 1 for local
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

  def location_params
    params.require(:location).permit(:name, :street, :city, :state, :zip)
  end

  def venue_params
    params.require(:venue).permit(:name, :venue_type, :second_type, :latitude, :longitude, :foursquare_id, :street, :city, :state, :zip, :country)
  end

end
