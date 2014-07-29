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
      expect{post :create, reward: FactoryGirl.attributes_for(:reward)}.to change(Reward, :count).by(1)
    end

    it 'does not create a new reward' do
      expect{post :create, Reward.new(:description => nil)}.to_not change(Reward, :count)

    end
  end

  describe 'GET #show' do
    it 'assigns reward to @reward' do
      reward = FactoryGirl.build(:reward)
      get :show, id: reward
      expect(assigns(:reward)).to eq reward
    end
  end

end
