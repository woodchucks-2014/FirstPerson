class Quest < ActiveRecord::Base
  belongs_to :creator, class_name: 'User' #alias the quest/user
  has_many :checkpoints
  has_many :rewards
  has_many :user_quests
  has_many :locations, through: :checkpoints
  has_many :users, through: :user_quests
  has_many :user_checkpoints, through: :checkpoints
  before_validation :set_defaults
  before_save :set_time_status, :set_user_status

  validates_presence_of :creator_id, :title, :end_date, :description

  def set_defaults
  	self.start_date ||= Time.now
    self.end_date ||= 1.year.from_now
    self.xp ||= 100
  end


  def self.user_accepted_quests(user)
    @quests=[]
    user.user_quests.each do |user_quest|
      quest = Quest.find(user_quest.quest_id)
      @quests << quest if user_quest.completed == false && quest.timestatus != 'expired'
    end
    return @quests.uniq
  end

  def self.user_available_quests(user)
    @quests=[]
    Quest.all.each do |quest|
      @quests << quest if quest.timestatus=='current' && quest.userstatus=='open' && quest.creator_id != user.id && quest.users.where(id: user.id).empty?
    end
    return @quests
  end

  def self.user_created_quests(user)
    @quests = Quest.where(creator_id: user.id)
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

  def set_time_status
    if self.start_date > Time.now
      self.timestatus = "unready"
    elsif self.end_date < Time.now
      self.timestatus = "expired"
    else
      self.timestatus = "current"
    end
  end

  def set_user_status
    if self.user_limit <= self.user_quests.count && self.user_limit != -1
      self.userstatus = "full"
    else
      self.userstatus = "open"
    end
  end


end
