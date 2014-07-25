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
    params = format(params)

    # CheckIn.create(checkin_params AND location params)

    render plain: "200 OK"
  end

  def testpush
  	render json: {lat: 53.385873, long: -1.471471}
  end

  private

  def checkin_params
    #also permit location params
    stuff_params = parse_foursquare_json(params)[]
    stuff_params.require("CheckIn").permit(:user_id, :location_id)
  end

  # def location_params
  #   stuff_params.require("location").permit(:user_id)
  # end

end
