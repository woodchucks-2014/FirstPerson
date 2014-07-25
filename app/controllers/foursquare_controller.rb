class FoursquareController < ActionController::Base

layout "application"
include AuthHelper
include PushHelper

  def index
    redirect_to auth_uri
  end

  def redirect
    token = token_receipt
    @api = Fsqr.new(token.token)
  end

  def map

  end

  def pull
    @params = params
    
    render plain: "200 OK" 
 end

  def testpush
  	render json: {lat: 53.385873, long: -1.471471}
  end

end
