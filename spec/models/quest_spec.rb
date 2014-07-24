require 'rails_helper'

RSpec.describe Quest, :type => :model do
  it {should belong_to(:creator).class_name('User')}
  it {should have_many(:rewards)}
  it {should have_many(:user_quests)}
  it {should have_many(:users).through(:user_quests)}
  it {should have_many(:checkpoints)}
  it {should have_many(:locations).through(:checkpoints)}
end