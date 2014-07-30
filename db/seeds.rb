# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tanner = User.new
tanner.firstname = "Tanner"
tanner.lastname = "Welsh"
tanner.email = "twelsh@dbc.com"
tanner.gender = "male"
tanner.foursquare_id = 1
tanner.save!

loc1 = Location.new
loc1.name = "Dev Bootcamp"
loc1.foursquare_id = ENV['DBC_ID']
loc1.venue_type = "Trade School"
loc1.street = "48 Wall St"
loc1.city = "New York"
loc1.state = "NY"
loc1.country = "US"
loc1.zip = "10005"
loc1.save!

loc2 = Location.new
loc2.name = "Starbucks"
loc2.foursquare_id = ENV['STAR_ID']
loc2.venue_type = "Coffee Shop"
loc2.street "875 Avenue of the Americas"
loc2.city "New York"
loc2.state "NY"
loc2.zip "10001"
loc2.country = "US"
loc2.save!

quest = Quest.new
quest.title = "Come watch the Woodchuck's presentations!"
quest.creator_id = tanner.id
quest.category = "Tech"
quest.description = "Attend a great tech event. You'll get to see 5 impressive projects that were built in just 7 days."
quest.xp = 9001
quest.end_date = Time.local(2014,"aug",1,12,30,0)
quest.save!

checkpoint = Checkpoint.new
checkpoint.instructions = "Cheer for FirstPerson.io"
checkpoint.quest_id = quest.id
checkpoint.location_id = loc1.id
checkpoint.step_num = 1
checkpoint.save!

reward = Reward.new
reward.quest_id = quest.id
reward.description = "You're an awesome person."
reward.save!

checkin = CheckIn.new
checkin.location_id = loc2.id
checkin.user_id = tanner.id
checkin.save!


