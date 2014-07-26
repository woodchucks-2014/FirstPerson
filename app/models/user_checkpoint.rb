class UserCheckpoint < ActiveRecord::Base
  belongs_to :user
  belongs_to :checkpoint

  def complete!
    unless self.completed
      self.completed = true
    end
  end
end
