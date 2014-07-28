class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  # the page for a particular award
  # shows a picture, has a description
  # says which quest it's from
  # user can either make one or receieve one
end
