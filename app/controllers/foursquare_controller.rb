class FoursquareController < ActionController::Base

layout "application"
include AuthHelper

  def index
    redirect_to auth_uri
  end

  def redirect
    token = token_receipt
    @api = Fsqr.new(token.token)
  end

  def map

  end

end
