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

  describe "GET notifications" do
  	it "renders notifications when signed in" do
  		session[:user_id] = 1
  		get :notifications
  		expect(response).to be_success
  	end
  end

  describe "GET notifications" do
  	it "renders empty json when signed out" do
  		get :notifications
  		expect(response).to be_success
  	end
  end  

  describe "GET test_login" do
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
      get :user_all_checkins_loc, {user_id: 1}, :format => :json
      expect(response).to be_success
    end

    it "should return a user's checkins" do
      FactoryGirl.create(:user)
      get :checkin_points, {user_id: 1}, :format => :json
      expect(response).to be_success
    end  
  end

  describe "GET boards" do
    it "returns http success" do
      get :boards
      expect(response).to be_success
    end
  end
  
  describe "GET xp" do
    it "renders the xp template for a user" do
      get :xp
      expect(response).to be_success
    end
  end

  describe "GET notifications" do
    it "shows for when users are logged in" do
      session[:user_id] = 1
      get :notifications, :format => :json
      expect(response).to be_success
    end
    
    it "does not show for when users are not logged in" do
      get :notifications
      expect(response).to be_success
    end

  end
  
end
