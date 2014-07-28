class QuestsController < ApplicationController

  def all
    @user_quest = UserQuest.new
    @quests = Quest.all.select { |quest| quest.checkpoints.length >= 1  }
    @hash = Gmaps4rails.build_markers(@quests) do |quest, marker|
      if quest.checkpoints.length >= 1
        marker.lat quest.checkpoints.first.location.latitude
        marker.lng quest.checkpoints.first.location.longitude
        marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
      end
    end
    render json: @hash
  end

  def accept_form
    @user_quest = UserQuest.new
    @quest = Quest.find(params[:quest_id])
    render partial: "quests/accept_form", layout: false
  end


  def main

    @quests = Quest.all
    @checkpoint = Checkpoint.new
    @user_quest = UserQuest.new
    @quest = Quest.new
  end

  def accept

    @user_quest = UserQuest.new(user_quest_params)

    if @user_quest.save
      flash[:notice] = "Quest successfully accepted"
      render partial: "quests/accepted", layout: false
    else
      flash[:notice] = "Please try again"
      render partial: "quests/rejected", layout: false
    end


  end


  def create
    @quest = Quest.new(quest_params)

    if @quest.save
      redirect_to quests_path
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end


  def set_location
    @checkpoint = Checkpoint.new(checkpoint_params)
    # quest.save!
    if @checkpoint.save
      redirect_to quests_path
      flash[:notice] = "Quest successfully created"
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end


  def accepted
  end

  def rejected
  end

  private

  def checkpoint_params
    location = Location.new
    location.address = params[:checkpoint][:locations][:address]
    location.save
    params[:checkpoint][:location_id] = location.id
    params.require(:checkpoint).permit(:instructions, :quest_id, :location_id)
  end

  def user_quest_params
    params[:user_quest][:user_id] = 1#current_user2.id
    params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  end

  def quest_params
    params[:quest][:creator_id] = 1#current_user2.id
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

end
