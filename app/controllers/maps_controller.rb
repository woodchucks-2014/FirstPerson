class MapsController < ApplicationController
  def show
    @user = User.find(2)
  end
end