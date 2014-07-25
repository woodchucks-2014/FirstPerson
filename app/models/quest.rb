class Quest < ActiveRecord::Base
  belongs_to :creator, class_name: 'User' #alias the quest/user
  has_many :checkpoints
  has_many :rewards
  has_many :user_quests
  has_many :locations, through: :checkpoints
  has_many :users, through: :user_quests

  before_create :set_defaults

  validates_presence_of :creator_id, :title, :end_date

  def set_defaults
  	self.start_date ||= Time.now
  end
end
