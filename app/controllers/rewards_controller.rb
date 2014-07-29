class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "New reward successfully created!"
      redirect_to quests_path
    else
      flash[:notice] = "Unable to create"
      render :create
    end

  end

  def show
    @reward = Reward.find(params[:id])
    @quest = @reward.quest
    @description = @reward.description
    render :show
  end

  private

  def reward_params
    params.require(:reward).permit(:description)
  end

end
