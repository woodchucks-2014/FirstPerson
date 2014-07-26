class QuestsController < ApplicationController

  def main
    @quests = Quest.all
    @quest = Quest.new
  end

  def create

  end

end
