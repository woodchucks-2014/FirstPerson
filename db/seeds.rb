# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business = User.new
business.firstname = "DBC"
business.email = "dishes@dbc.com"
business.foursquare_id = 1
business.save!

player = User.new
player.firstname = "Greg"
player.email = "greg@dbc.com"
player.gender = "male"
player.photo_url = "http://fc09.deviantart.net/fs70/i/2012/164/1/a/chie_satonaka_by_melrw22-d53c8jj.jpg"
player.foursquare_id = 2
player.save!

checkin_loc = Location.new
checkin_loc.name = "CheckIn1"
checkin_loc.venue_type = "checkin_loc1"
checkin_loc.latitude = 40.7703
checkin_loc.longitude = -73.9997
checkin_loc.street = "160 34th St"
checkin_loc.city = "New York"
checkin_loc.state = "NY"
checkin_loc.country = "US"
checkin_loc.zip = "10016"
checkin_loc.foursquare_id = "kjf3jfosefjw"
checkin_loc.save!

checkin_loc2 = Location.new
checkin_loc2.name = "CheckIn2"
checkin_loc2.venue_type = "checkin_loc2"
checkin_loc2.latitude = 40.5703
checkin_loc2.longitude = -74.6997
checkin_loc2.foursquare_id = "kjf3jfosefjw"
checkin_loc2.save!

quest_loc3 = Location.new
quest_loc3.name = "quest3"
quest_loc3.venue_type = "quest_loc3"
quest_loc3.latitude = 40.5503
quest_loc3.longitude = -74.4997
quest_loc3.foursquare_id = "kjf3jfosefjw"
quest_loc3.save!

quest = Quest.new
quest.title = "Come Get A Beer!"
quest.creator_id = business.id
quest.category = "bar"
quest.description = "The search for beer commences"
quest.xp = 500
quest.end_date = Time.now + 1.day
quest.save!

checkpoint = Checkpoint.new
checkpoint.instructions = "Receive beer"
checkpoint.quest_id = quest.id
checkpoint.location_id = quest_loc3.id
checkpoint.step_num = 1
checkpoint.save!

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


