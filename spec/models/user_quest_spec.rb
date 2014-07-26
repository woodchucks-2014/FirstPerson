require 'rails_helper'

RSpec.describe UserQuest, :type => :model do
  let(:user_quest) {FactoryGirl.create :user_quest}

  it {should belong_to(:quest)}
  it {should belong_to(:user)}

  it "should attribute XP to user when a quest is completed via the #complete! method" do
    business = User.new
    business.firstname = "DBC"
    business.email = "dishes@dbc.com"
    business.foursquare_id = 1
    business.save!

    bar = Location.new
    bar.name = "Awesome Bar"
    bar.venue_type = "Bar"
    bar.latitude = 40.7903
    bar.longitude = -73.9597
    bar.address = "48 Wall St, New York, NY 10005"
    bar.save!

    checkin_loc = Location.new
    checkin_loc.name = "CheckIn"
    checkin_loc.venue_type = "checkin_loc"
    checkin_loc.latitude = 40.7703
    checkin_loc.longitude = -73.9997
    checkin_loc.save!

    greg = User.new
    greg.firstname = "Greg"
    greg.email = "greg@dbc.com"
    greg.save!

    quest = Quest.new
    quest.title = "Come Get A Beer!"
    quest.creator_id = business.id
    quest.category = "bar"
    quest.end_date = Time.now + 1.day
    quest.save!

    beer = Reward.new
    beer.quest_id = quest.id
    beer.xp = 500
    beer.save!

    checkpoint = Checkpoint.new
    checkpoint.instructions = "Receive beer"
    checkpoint.quest_id = quest.id
    checkpoint.location_id = bar.id
    checkpoint.step_num = 1
    checkpoint.save!

    greg_gets_a_beer = UserQuest.new
    greg_gets_a_beer.quest_id = quest.id
    greg_gets_a_beer.user_id = greg.id
    greg_gets_a_beer.complete!

    greg_gets_a_reward = UserReward.new
    greg_gets_a_reward.reward_id = beer.id
    greg_gets_a_reward.user_id = greg.id
    greg_gets_a_reward.save!

    gregs_checkin = CheckIn.new
    gregs_checkin.location_id = checkin_loc.id
    gregs_checkin.user_id = greg.id
    gregs_checkin.save!

    gregs_checkpoint = UserCheckpoint.new
    gregs_checkpoint.user_id = greg.id
    gregs_checkpoint.checkpoint_id = checkpoint.id
    gregs_checkpoint.completed = true
    gregs_checkpoint.save!
  end

  # pending "the complete method should update a user's total xp."


  # pending "validates presence of certain attributes."

end
