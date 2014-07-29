class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    # @quest = Quest.find(params[:id])
    @reward = Reward.new
    if @reward.save
      flash[:notice] = "New reward successfully created!"
      render :create #will reroute later...it gets the test to pass
    else
      flash[:notice] = "Unable to create"
      render :create
    end

  end

  def reward_params
    params.require(:reward).permit(:description)
  end


  def show_reward
    @reward = Reward.find_by(params[:id])
    @quest = @reward.quest
    @description = @reward.description
    render :show
  end



end
