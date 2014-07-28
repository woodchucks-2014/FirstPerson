require 'rails_helper'

RSpec.describe "home" do
  describe "Non-logged in user sees login button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#sign_in_link")
    end

    it "results a 200 status code" do
      visit '/'
      expect(page.status_code).to eq(200)
    end

  end
  

  context 'buttons' do
    it "has signin button" do
      visit '/'
      expect(page).to have_selector("a", text: "Sign In")
    end

    it "has signup button" do
      visit '/'
      expect(page).to have_selector("a", text: "Sign Up")
    end

    # it "button redirects user" do
    #   visit '/'
    #   click_link('Sign In')
    #   expect(current_path).to 

    # end  

  end



  

end

