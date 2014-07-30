require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
  	it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "renders the 'user/home template" do
    	get :index
    	expect(response).to render_template('users/home')
    end
  end 
end
