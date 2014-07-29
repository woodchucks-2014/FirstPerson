class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    # @quest = Quest.find(params[:id])
    @reward = Reward.new
    if @reward.save
      flash[:notice] = "New reward successfully created!"
      render :create
    else
      flash[:notice] = "Unable to create"
      render :create
    end

  end



  # the page for a particular award
  # shows a picture, has a description
  # says which quest it's from
  # user can either make one or receieve one
end
