class UserQuest < ActiveRecord::Base
  belongs_to :quest
  belongs_to :user

  def complete!
    unless self.complete
      self.complete = true
      earned_xp = self.quest.rewards.map(|reward| reward.xp).reduce(:+)
      self.user.total_xp += earned_xp
    end
  end
end
