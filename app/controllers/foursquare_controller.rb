class FoursquareController < ActionController::Base
layout "application"
include AuthHelper
<<<<<<< HEAD
include PushHelper
=======

>>>>>>> 31d0208a1dbbf40859f164c1b14a320db6af1095
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
  	# response = push_helper
  	# p JSON.parse(response)
  	
  end

  def testpush
  	render json: {lat: 53.385873, long: -1.471471}
  end

end
