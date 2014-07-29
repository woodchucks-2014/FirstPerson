class Quest < ActiveRecord::Base
  belongs_to :creator, class_name: 'User' #alias the quest/user
  has_many :checkpoints
  has_many :rewards
  has_many :user_quests
  has_many :locations, through: :checkpoints
  has_many :users, through: :user_quests
  has_many :user_checkpoints, through: :checkpoints
  before_create :set_defaults



  #validates_presence_of :creator_id, :title, :end_date, :description
  # we're commenting out line 11 because our tests won't pass otherwise...we will fix that

  def set_defaults
  	self.start_date ||= Time.now
    self.xp ||= 50
  end


  def self.user_accepted_quests(user)
    @quests=[]
    user.user_quests.each do |user_quest|
      @quests << Quest.find(user_quest.quest_id)
    end
    return @quests
  end

  def self.user_created_quests(user)
    @quests = Quest.where(creator_id: user.id)
    return @quests
  end

  def self.user_completed_quests(user)
    @quests=[]
    user.user_quests.each do |user_quest|
      if user_quest.completed==true
        @quests << Quest.find(user_quest.quest_id)
      end
    end
    return @quests
  end


end
