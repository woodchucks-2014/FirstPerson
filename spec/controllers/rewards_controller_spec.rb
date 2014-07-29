require 'rails_helper'

RSpec.describe RewardsController, :type => :controller do

  describe 'GET #new' do
    it 'assigns a new reward to @reward' do
      get :new
      expect(assigns(:reward)).to be_a_new(Reward)
    end
  end



  describe 'POST #create' do
    it 'creates a new reward' do
      post :create, reward: FactoryGirl.attributes_for(:reward)
      expect(response).to be_success
    end
  end

  # describe 'POST #create' do
  #   let(:reward) {create :reward}
  #   context "with valid attributes" do
  #     it "saves the new reward in the database" do
  #       expect{post :create, reward: attributes_for(:reward)}.to change(Reward, :count).by(1)

  #     end
  #   end
  # end
end
