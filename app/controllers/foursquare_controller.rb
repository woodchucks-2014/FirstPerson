class FoursquareController < ActionController::Base
include AuthHelper
  def index
    redirect_to auth_uri
  end

  def redirect
    token = token_receipt
    @user = Foursquare.new(token)
  end

end
