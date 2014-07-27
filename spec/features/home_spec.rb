require 'rails_helper'

RSpec.describe "home" do
  describe "Non-logged in user sees login button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#sign_in_link")
    end

  end
  

  context 'buttons' do
    it "has signin button" do
      visit '/'
      expect(page).to have_selector("a", text: "Sign In")
    end
  end

  context 'buttons' do
    it "has signup button" do
      visit '/'
      expect(page).to have_selector("a", text: "Sign Up")
    end
  end



  # describe "Clicking on 'sign in' button redirects user" do
  #   it "button directs to the correct page" do
  #     visit '/'
  #     click_link('Sign In')
  #     expect(current_path).to not_eq '/'

  #   end  

  # end
end

