require 'rails_helper'

RSpec.describe "home" do
  describe "Non-logged in user sees login button" do
    it "by visiting homepage" do
      visit '/'
      expect(page).to have_css("#sign_in_link")
    end
  end

  

end

# feature 'Show home page', do

# let(:user) {create(:user)}
#   scenario 'user not logged in' do
#     visit '/'
#     expect(current_path).to eq(home_path)
#   end

# end