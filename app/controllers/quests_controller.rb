class QuestsController < ApplicationController

  def all
    @user_quest = UserQuest.new
    @markers = Quest.all
    @hash = Gmaps4rails.build_markers(@markers) do |quest, marker|
      marker.lat quest.checkpoints.first.location.latitude
      marker.lng quest.checkpoints.first.location.longitude
      marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}'></iframe>"
    end
    render json: @hash
  end

  def accept_form
    @user_quest = UserQuest.new
    @quest = Quest.find(params[:quest_id])

  end


  def main
    @markers = Location.all
    @quests = Quest.all
    @quest = Quest.new
    @user_quest = UserQuest.new
  end

  def accept
    #change the shit below
    @user_quest = UserQuest.new(quest_id: params[:user_quest], user_id: 1)

    if @user_quest.save
       redirect_to accepted_path
      flash[:notice] = "Quest successfully accepted"
    else
      flash[:notice] = "Please try again"
       redirect_to rejected_path
    end


  end

  def accepted
  end

  def rejected
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to quests_path
      flash[:notice] = "Quest successfully created"
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end

  private

  # def user_quest_params
  #   params[:user_quest][:user_id] = 1#current_user2.id
  #   params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  # end

  def quest_params
    params[:quest][:creator_id] = 1#current_user2.id
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

end
