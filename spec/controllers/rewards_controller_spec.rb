require 'rails_helper'

RSpec.describe RewardsController, :type => :controller do

  describe 'GET #new' do
    it 'assigns a new Reward to @reward' do
      get :new
      expect(assigns(:reward)).to be_a_new(Reward)
    end
  end
end
