require 'rails_helper'

RSpec.describe RewardsController, :type => :controller do

  describe 'GET #show' do
    it 'assigns existing reward to @reward' do
      reward = Reward.create(description: "New stuff")
      get :show, id: reward
      expect(assigns(:rewards)).to eq([reward])
    end

  end

end
