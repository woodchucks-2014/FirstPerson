require 'rails_helper'

RSpec.describe "home" do
  describe "Non-logged in user sees login button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#enter_link")
    end
  end

  context 'buttons' do
    it "has signin button" do
      visit '/'
      expect(page).to have_selector("a", text: "Enter")
    end
  end

end
