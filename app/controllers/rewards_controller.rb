class RewardsController < ApplicationController

  def show
    @rewards = Reward.all
    p @rewards
    render partial: "rewards/show"
  end

end
