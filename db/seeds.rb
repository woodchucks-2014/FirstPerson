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
business.password = "test"
business.password_confirmation = "test"
business.save!

bar = Location.new
location.name = "Awesome Bar"
location.type = "Bar"
location.lat = 40.7903
location.lng = 73.9597
location.save!
#should locations belong to a user? perhaps through quests and checkpoints

player = User.new
player.name = "Greg"
player.email = "greg@dbc.com"
player.password = "test"
player.password_confirmation = "test"
player.save!

quest = Quest.new
quest.title = "Come Get A Beer!" # Quest neests a title
quest.creator_id = business.id
quest.type = "bar"
quest.end_date = Time.now + 1.day
quest.save!

beer = Reward.new
beer.quest_id = quest.id
beer.xp = 500

checkpoint = Checkpoint.new
quest.instruction = "Recieve beer" # checkpoints need an instruction
quest.quest_id = quest.id
quest.location_id = bar.id
quest.step_num = 1

greg_gets_a_beer = UserQuest.new
greg_gets_a_beer.quest_id = quest.id
greg_gets_a_beer.user_id = greg.id

# user_checkpoints should be automattically created using a before_create method on user_quests





