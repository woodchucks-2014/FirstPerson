require 'rails_helper'

RSpec.describe Quest, :type => :model do
  it {should belong_to(:creator).class_name('User')}
  it {should have_many(:rewards)}
  it {should have_many(:user_quests)}
  it {should have_many(:users).through(:user_quests)}
  it {should have_many(:checkpoints)}
  it {should have_many(:locations).through(:checkpoints)}

  # it "should view user accepted quests" do
  # 	user = FactoryGirl.create(:user, user_id: 10)
  # 	user_quest = FactoryGirl.create(:user_quest, user_id: 10, quest_id: 10)
  # 	quest = FactoryGirl.create(:quest, quest_id: 10)
  describe "Quest Model" do
    it "returns a location using the location method" do
      quest = FactoryGirl.create(:quest)
      expect(quest.locations.first).to eq(quest.location)
    end
  end
end