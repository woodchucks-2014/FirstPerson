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

    it "renders the 'user/home template when not logged in" do
    	get :index
    	expect(response).to render_template('users/home')
    end

    it "renders the 'user/home template when logged in" do
    	session[:user_id] = 1
    	get :index
    	expect(response).to render_template('maps/show')
    end
  end

  describe "get test_login" do
  	it "redirects to root path" do
  		session[:user_id] = 2
  		get :test_login
  		expect(response).to redirect_to root_path
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
    it "should return all checkins" do
      FactoryGirl.create(:user)
      get :user_all_checkins_loc, {user_id: 1}
      # expect(response).to eq([{}])
    end

    it "should return a user's checkins" do
      FactoryGirl.create(:user)
      get :checkin_points, {user_id: 1}
      # expect(session[:user_id]).to eq([{}])
    end
  end
end
