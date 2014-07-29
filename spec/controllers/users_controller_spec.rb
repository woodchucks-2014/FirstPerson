require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
  	it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "renders maps#show for a valid user" do
    	visit 
      get :index
      expect(response).to render_template :index
    end
  end
end
