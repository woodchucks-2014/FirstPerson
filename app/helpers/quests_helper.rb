module QuestsHelper

#need another method in here to check step num, this is rudimentary
#also need to a quest status to filter out quests that arent valid yet, invalid now, etc..
	def quest_check(user, location)
		accepted_quests = user.quests.includes(checkpoints:[:user_checkpoints])
		accepted_quests.each do |quest|
			quest.checkpoints.each do |checkpoint|
				if checkpoint.location.foursquare_id == location.foursquare_id
					checkpoint.user_checkpoints.find_by(user_id: user.id).update(completed: true)
				end
			end
		end
	end

end
