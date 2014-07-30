class RewardsController < ApplicationController
  # def new
  #   @reward = Reward.new
  # end

  # def create
  #   @reward = Reward.new(reward_params)
  #   if @reward.save
  #     flash[:notice] = "New reward successfully created!"
  #     redirect_to quests_path
  #   else
  #     flash[:notice] = "Unable to create"
  #     render :create
  #   end

  # end

  def show
    @rewards = Reward.all
    p @rewards
    render partial: "rewards/show"
  end

#   private

#   def reward_params
#     params.require(:reward).permit(:description)
#   end

end
