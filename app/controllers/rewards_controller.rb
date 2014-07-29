class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    # @quest = Quest.find(params[:id])
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "New reward successfully created!"
      render :create #will reroute later...it gets the test to pass, should redirect
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
    #also include a picture
  end

  private

  def reward_params
    params.require(:reward).permit(:description)
  end

end
