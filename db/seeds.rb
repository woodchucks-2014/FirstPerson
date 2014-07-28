# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


player = User.new
player.firstname = "Greg"
player.email = "greg@dbc.com"
player.gender = "male"
player.foursquare_id = 2
player.save!

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
checkin_loc.latitude = 40.7303
checkin_loc.longitude = -73.9597
checkin_loc.save!

checkin_loc1 = Location.new
checkin_loc1.name = "CheckIn"
checkin_loc1.venue_type = "checkin_loc1"
checkin_loc1.latitude = 40.7602
checkin_loc1.longitude = -73.9996
checkin_loc1.save!

checkin_loc2 = Location.new
checkin_loc2.name = "CheckIn"
checkin_loc2.venue_type = "checkin_loc2"
checkin_loc2.latitude = 40.7701
checkin_loc2.longitude = -73.9098
checkin_loc2.save!

checkin_loc3 = Location.new
checkin_loc3.name = "CheckIn"
checkin_loc3.venue_type = "checkin_loc3"
checkin_loc3.latitude = 40.7500
checkin_loc3.longitude = -73.9799
checkin_loc3.save!

quest = Quest.new
quest.title = "Come Get A Beer!"
quest.creator_id = business.id
quest.category = "bar"
quest.description = "The search for beer commences"
quest.xp = 500
quest.end_date = Time.now + 1.day
quest.save!

quest1 = Quest.new
quest1.title = "Lick Trees"
quest1.creator_id = business.id
quest1.category = "eating"
quest1.description = "The search for trees commences"
quest1.end_date = Time.now + 1.day
quest1.save!

quest2 = Quest.new
quest2.title = "Pet Stones"
quest2.creator_id = business.id
quest2.category = "petting"
quest2.description = "The search for rocks commences"
quest2.end_date = Time.now + 1.day
quest2.save!

quest3 = Quest.new
quest3.title = "Tame Sloths"
quest3.creator_id = business.id
quest3.category = "taming"
quest3.description = "The search for sloths commences"
quest3.end_date = Time.now + 1.day
quest3.save!

checkpoint = Checkpoint.new
checkpoint.instructions = "Receive beer"
checkpoint.quest_id = quest.id
checkpoint.location_id = bar.id
checkpoint.step_num = 1
checkpoint.save!

checkpoint1 = Checkpoint.new
checkpoint1.instructions = "Receive beer"
checkpoint1.quest_id = 2
checkpoint1.location_id = checkin_loc.id
checkpoint1.step_num = 1
checkpoint1.save!

checkpoint2 = Checkpoint.new
checkpoint2.instructions = "Receive beer"
checkpoint2.quest_id = 3
checkpoint2.location_id = checkin_loc1.id
checkpoint2.step_num = 1
checkpoint2.save!

checkpoint3 = Checkpoint.new
checkpoint3.instructions = "Receive beer"
checkpoint3.quest_id = 4
checkpoint3.location_id = checkin_loc2.id
checkpoint3.step_num = 1
checkpoint3.save!

beer = Reward.new
beer.quest_id = quest.id
beer.description = "Yay! Beer!"
beer.save!

greg_gets_a_beer = UserQuest.new
greg_gets_a_beer.quest_id = quest.id
greg_gets_a_beer.user_id = player.id
greg_gets_a_beer.complete!

greg_gets_a_reward = UserReward.new
greg_gets_a_reward.reward_id = beer.id
greg_gets_a_reward.user_id = player.id
greg_gets_a_reward.save!
greg_gets_a_beer.save!

gregs_checkin = CheckIn.new
gregs_checkin.location_id = checkin_loc.id
gregs_checkin.user_id = player.id
gregs_checkin.save!

gregs_checkin2 = CheckIn.new
gregs_checkin2.location_id = checkin_loc2.id
gregs_checkin2.user_id = player.id
gregs_checkin2.save!

gregs_checkpoint = UserCheckpoint.new
gregs_checkpoint.user_id = player.id
gregs_checkpoint.checkpoint_id = checkpoint.id
gregs_checkpoint.complete!
gregs_checkpoint.save!

gregs_checkpoint1 = UserCheckpoint.new
gregs_checkpoint1.user_id = player.id
gregs_checkpoint1.checkpoint_id = checkpoint1.id
gregs_checkpoint1.complete!
gregs_checkpoint1.save!

gregs_checkpoint2 = UserCheckpoint.new
gregs_checkpoint2.user_id = player.id
gregs_checkpoint2.checkpoint_id = checkpoint2.id
gregs_checkpoint2.complete!
gregs_checkpoint2.save!

gregs_checkpoint3 = UserCheckpoint.new
gregs_checkpoint3.user_id = player.id
gregs_checkpoint3.checkpoint_id = checkpoint3.id
gregs_checkpoint3.complete!
gregs_checkpoint3.save!


