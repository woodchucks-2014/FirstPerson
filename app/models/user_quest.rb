class UserQuest < ActiveRecord::Base
  belongs_to :quest
  belongs_to :user

  after_create :create_related_checkpoints

  def complete!
    unless self.completed
      self.completed = true
      earned_xp = self.quest.xp
      self.user.total_xp += earned_xp
      self.user.save!
    end
  end

  def checkpoints

    #return user_checkpoints that belong to this quest
    # self.quest.include(:checkpoints).checkpoints.where(user_id: self.user.id)
  end

  def create_related_checkpoints
    self.quest.checkpoints
  end
end

