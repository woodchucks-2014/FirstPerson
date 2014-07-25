class UserQuest < ActiveRecord::Base
  belongs_to :quest
  belongs_to :user

  after_create :create_related_checkpoints

  def complete!
    unless self.complete
      self.complete = true
      earned_xp = self.quest.rewards.map{|reward| reward.xp}.reduce(:+)
      self.user.total_xp += earned_xp
    end
  end

  def checkpoints
    #return user_checkpoints that belong to this quest
    # self.quest.checkpoints
  end

  def create_related_checkpoints
    self.quest.checkpoints
  end
end
