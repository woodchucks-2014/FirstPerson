require 'rails_helper'

RSpec.describe UserQuest, :type => :model do
  let(:user_quest) {FactoryGirl.create :user_quest}
  let(:player) {FactoryGirl.create(:user, email: "ichliebebmw@dbc.de")}
  let(:business) {FactoryGirl.create(:user, email: "boozemuhkidney@yahoo.com")}
  let(:quest) {FactoryGirl.create :quest}
  let(:checkpoint) {FactoryGirl.create(:checkpoint, quest_id: 2, location_id: 3)}
  let(:user_checkpoint) {FactoryGirl.create(:user_checkpoint, user_id: 4, checkpoint_id: 2)}
  let(:location) {FactoryGirl.create :location}

  it {should belong_to(:quest)}
  it {should belong_to(:user)}

  it "attributes XP to user when a quest is completed via the #complete! method" do
    user_quest.user = player
    user_quest.complete!
    expect(player.total_xp).to eq(quest.xp)
  end

  it "creates related checkpoints" do
    expect(user_quest.create_related_checkpoints).to eq(user_quest.quest.checkpoints)
  end

end