module QuestsHelper

#need another method in here to check step num, this is rudimentary
#also need to a quest status to filter out quests that arent valid yet, invalid now, etc..
	def user_checkpoint_check(user, checkin)
		#i want the following line to have .where(location_id: location.id) and only load those, however
		#at this time i am not sure it will work because multiple locations may be created. going to fix that.
		user.checkpoints.each do |checkpoint|
			if checkpoint.location.foursquare_id == checkin.foursquare_id
				checkpoint.user_checkpoints.find_by(user_id: user.id).update(completed: true)
				user_quest_check(user, checkpoint)
			end
		end
	end

	def user_quest_check(user, checkpoint)
		quest = Quest.find(checkpoint.quest_id).includes(:user_checkpoints).where(user_id: user.id)
		if quest.user_checkpoints.where(user_id: user.id).all?{|record| record.completed == true}
			quest.user_quests.find_by(user_id: user.id).update(completed: true)
		end
	end

	# def end_quest(quest)

	# 	if quest.user_quests.all?{|record| record.completed == true}

	# 	end
	# end


end
