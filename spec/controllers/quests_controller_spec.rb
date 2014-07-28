require 'rails_helper'

RSpec.describe QuestsController, :type => :controller do

  describe "GET main" do
    it "returns http success" do
      get :main
      expect(response).to be_success
    end

    # it "redirects with 301" do
    #   click_button 'Sign Up'
    #   expect(response).to redirect_to 301

    # end  

    # Trying to get it to just recognize that clicking a button
    # causes a redirect
  end
end
