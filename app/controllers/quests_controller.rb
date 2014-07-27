class QuestsController < ApplicationController

  def main
    @quests = Quest.all
    @quest = Quest.new
    @user_quest = UserQuest.new
  end

  def accept

    @user_quest = UserQuest.new(user_quest_params)

    if @user_quest.save
      redirect_to quests_path
      flash[:notice] = "Quest successfully accepted"
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end


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

  def all
    quests = Quests.all
    @checkpoints = quests.map { |quest| quest.checkpoints.first }
    @hash = Gmaps4rails.build_markers(@checkpoints) do |checkpoint, marker|
      marker.lat checkpoint.location.latitude
      marker.lng checkpoint.location.longitude
      marker.infowindow "Hello"
    end
    render json: @hash
  end

  private

  def user_quest_params
    params[:user_quest][:user_id] = 1#current_user2.id
    params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  end

  def quest_params
    params[:quest][:creator_id] = 1#current_user2.id
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

end
