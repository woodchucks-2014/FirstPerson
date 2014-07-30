require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
  	it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET profile" do
    it "returns http success" do
      get :profile
      expect(response).to be_success
    end
  end

  describe "GET logout" do
  	it "should logout a user" do
	  	session[:user_id] = 1
	  	get :logout, {}
	  	expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq(nil)
	  end
  end

  describe "json responses" do
    it "should logout a user" do
      session[:user_id] = 1
      get :logout, {}
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq(nil)
    end

    it "should logout a user" do
      session[:user_id] = 1
      get :logout, {}
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq(nil)
    end
  end



  def user_all_checkins_loc
    current_user
    checkins = build_checkpoints_hash(@user.check_ins)
    render json: checkins
  end

  def checkin_points
    checkins = build_checkpoints_hash(CheckIn.all)
    render json: checkins
  end

# /user_all_checkins_loc(.:format)     
# users#user_all_checkins_loc
# users_checkins GET  /users/checkins(.:format)            
# users#checkin_points

end
