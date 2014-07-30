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

loc = Location.new
loc.name = "CheckIn1"
loc.venue_type = "loc1"
loc.street = "48 Wall St"
loc.city = "New York"
loc.state = "NY"
loc.country = "US"
loc.zip = "10005"
loc.foursquare_id = "kjf3jfosefjw"
loc.save!

loc2 = Location.new
loc2.name = "CheckIn2"
loc2.venue_type = "loc2"
loc2.street = "416 Water St"
loc2.city = "New York"
loc2.state = "NY"
loc2.country = "US"
loc2.zip = "10002"
loc2.foursquare_id = "kjfhelpsefjw"
loc2.save!

quest_loc = Location.new
quest_loc.name = "quest"
quest_loc.venue_type = "loc3"
quest_loc.street = "11 Wall Street"
quest_loc.city = "New York"
quest_loc.state = "NY"
quest_loc.country = "US"
quest_loc.zip = "10005"
quest_loc.foursquare_id = "kjf3jfosefjw"
quest_loc.save!

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
checkpoint.location_id = quest_loc.id
checkpoint.step_num = 1
checkpoint.save!

beer = Reward.new
beer.quest_id = quest.id
beer.description = "Yay! Beer!"
beer.save!

burger = Reward.new
burger.quest_id = quest.id
burger.description = "Get some food, too!"
burger.save!

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
gregs_checkin.location_id = loc.id
gregs_checkin.user_id = player.id
gregs_checkin.save!

gregs_checkin2 = CheckIn.new
gregs_checkin2.location_id = loc2.id
gregs_checkin2.user_id = player.id
gregs_checkin2.save!

gregs_checkpoint = UserCheckpoint.new
gregs_checkpoint.user_id = player.id
gregs_checkpoint.checkpoint_id = checkpoint.id
gregs_checkpoint.complete!
gregs_checkpoint.save!


