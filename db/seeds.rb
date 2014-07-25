# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business = User.new
business.name = "DBC"
business.email = "dishes@dbc.com"
business.password = "testtest"
business.password_confirmation = "testtest"
business.save!

bar = Location.new
bar.name = "Awesome Bar"
bar.venue_type = "Bar"
bar.latitude = 40.7903
bar.longitude = -73.9597
bar.save!

checkin_loc = Location.new
checkin_loc.name = "CheckIn"
checkin_loc.venue_type = "checkin_loc"
checkin_loc.latitude = 40.7703
checkin_loc.longitude = -73.9997
checkin_loc.save!

player = User.new
player.name = "Greg"
player.email = "greg@dbc.com"
player.password = "testtest"
player.password_confirmation = "testtest"
player.save!

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
checkpoint.instructions = "Recieve beer"
checkpoint.quest_id = quest.id
checkpoint.location_id = bar.id
checkpoint.step_num = 1
checkpoint.save!

greg_gets_a_beer = UserQuest.new
greg_gets_a_beer.quest_id = quest.id
greg_gets_a_beer.user_id = player.id
greg_gets_a_beer.complete!

# greg_gets_a_reward = UserReward.new
# greg_gets_a_reward.reward_id = beer.id
# greg_gets_a_reward.user_id = player.id

greg_gets_a_beer.save!

# user_checkpoints should be automatically created using a before_create method on user_quests

gregs_checkin = CheckIn.new
gregs_checkin.location_id = checkin_loc.id
gregs_checkin.user_id = player.id
gregs_checkin.save!








