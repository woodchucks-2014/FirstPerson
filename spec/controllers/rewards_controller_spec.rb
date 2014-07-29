require 'rails_helper'

RSpec.describe RewardsController, :type => :controller do

  # describe 'GET #new' do
  #   it 'assigns a new reward to @reward' do
  #     get :new
  #     expect(assigns(:reward)).to be_a_new(Reward)
  #   end
  # end

  # describe 'POST #create' do
  #   context "with valid attributes" do
  #     it 'creates a new reward' do
  #       expect{post :create, reward: {description: "A new reward"}}.to change(Reward, :count).by(1)
  #     end

  #   end

  #   context 'with invalid attributes' do
  #     it 'does not create a new reward' do
  #       expect{post :create, reward: {description: nil}}.to_not change(Reward, :count)
  #     end
  #   end
  # end

  describe 'GET #show' do
    it 'assigns existing reward to @reward' do
      reward = Reward.create(description: "New stuff")
      get :show, id: reward
      expect(assigns(:reward)).to eq(reward)
    end
  end




end
