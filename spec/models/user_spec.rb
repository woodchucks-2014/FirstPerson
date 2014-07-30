require 'rails_helper'

RSpec.describe User, :type => :model do
  it {should have_many(:created_quests).class_name('Quest').with_foreign_key('creator_id')}
  it {should have_many(:user_quests)}
  it {should have_many(:quests).through(:user_quests)}
  it {should have_many(:user_rewards)}
  it {should have_many(:rewards).through(:user_rewards)}
  it {should have_many(:user_checkpoints)}
  it {should have_many(:checkpoints).through(:user_checkpoints)}
  it {should have_many(:check_ins)}
  it {should have_many(:locations).through(:check_ins)}
  it {should have_many(:notifications)}


  # build some users, assign them xp, list them in descending order

  it 'orders users by total xp' do
    user1 = FactoryGirl.build(:user, :total_xp => 400)
    user2 = FactoryGirl.build(:user, :total_xp => 200)
    users = User.sort_users
    expect(users).to eq([user1, user2])
  end
end

# we're going to have to build a another method in the user model that outputs
# that array, and then write this test based off that.