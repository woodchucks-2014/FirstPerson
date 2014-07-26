require 'rails_helper'

RSpec.describe UserQuest, :type => :model do
  let(:user_quest) {FactoryGirl.create :user_quest}

  it {should belong_to(:quest)}
  it {should belong_to(:user)}

  it "should be completable via the #complete! method" do
    quest = Quest.new
    greg = User.new
    greg.firstname = "Greg"
    greg.email = "greg@dbc.com"
    beer = Reward.new
    beer.quest_id = quest.id
    beer.xp = 500
    beer.save!

    greg_gets_a_beer = UserQuest.new
    greg_gets_a_beer.quest_id = quest.id
    greg_gets_a_beer.user_id = greg.id
    greg_gets_a_beer.complete!

    # greg_gets_a_reward = UserReward.new
    # greg_gets_a_reward.reward_id = beer.id
    # greg_gets_a_reward.user_id = greg.id
    # greg_gets_a_reward.save!

    # greg_gets_a_beer.save!
  end

  pending "the complete method should update a user's total xp."

  pending "validates presence of certain attributes."

end
