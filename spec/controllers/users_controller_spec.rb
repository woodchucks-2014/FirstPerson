require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
  	it "returns http success" do
      get :index
      expect(response).to be_success
    end

    # it "renders maps#show for a valid user" do
    # 	visit 
    #   get :index
    #   expect(response).to render_template :index
    # end
  end

  # describe "GET test_login" do
  # 	it "should redirect to root path" do
	 #  	session[:user_id] = 2
	 #  	get: test_login
	 #  	expect(response).to redirect_to root_path
	 #  end
  # end

  # describe "GET logout" do
  # 	it "should logout a user" do
	 #  	session[:user_id] = 2
	 #  	session[:user_id] = nil
	 #  	expect(response).to redirect_to root_path
	 #  end
  # end
end
