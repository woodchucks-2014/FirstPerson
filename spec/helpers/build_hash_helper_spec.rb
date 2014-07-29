require 'rails_helper'

RSpec.describe BuildHashHelper, :type => :helper do

  let(:quest) {
    quest = Quest.new
    quest.title = "Come Get A Beer!"
    quest.creator_id = 1
    quest.category = "bar"
    quest.description = "The search for beer commences"
    quest.xp = 500
    quest.end_date = Time.now + 1.day
    quest.save!
    quest
  }

  let(:location) {
    quest_loc = Location.new
    quest_loc.name = "quest"
    quest_loc.venue_type = "quest_loc1"
    quest_loc.latitude = 40.5503
    quest_loc.longitude = -74.4997
    quest_loc.foursquare_id = "kjf3jfosefjw"
    quest_loc.save!
    location
  } 

  let(:checkpoint) {
    checkpoint = Checkpoint.new
    checkpoint.instructions = "Receive beer"
    checkpoint.quest_id = quest.id
    checkpoint.location_id = quest_loc.id
    checkpoint.step_num = 1
    checkpoint.save!
    checkpoint
  }

  let(:checkpoint) {
    checkpoint = Checkpoint.new
    checkpoint.instructions = "Receive beer"
    checkpoint.quest_id = quest.id
    checkpoint.location_id = quest_loc.id
    checkpoint.step_num = 1
    checkpoint.save!
    checkpoint
  }

  let(:checkin) {
    check = CheckIn.new
    check.location_id = location.id
    check.user_id = 1
    check.save!
    check
  }

  it "returns a hash of quests" do
    q = quest
    l = location
    c = checkpoint
    json = ""
    p build_quests_hash([q])
    expect(build_quests_hash([q])).to eq(json)
  end

  it "returns a hash of checkins" do
    l = location
    c = checkin
    json = ""
    expect(build_checkins_hash([c])).to eq(json)
  end

end

