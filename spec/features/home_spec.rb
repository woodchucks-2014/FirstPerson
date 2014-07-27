require 'rails_helper'

RSpec.describe "home" do
  describe "Non-logged in user sees login button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#sign_in_link")
    end

  end

  describe "Non-logged in user sees signup button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#sign_up_link")
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



  
    

  end

end

