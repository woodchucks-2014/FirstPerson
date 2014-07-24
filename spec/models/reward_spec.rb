require 'rails_helper'

RSpec.describe Reward, :type => :model do
  it {should belong_to(:quest)}
  it {should have_many(:user_rewards)}
  it {should have_many(:users).through(:user_rewards)}
end
