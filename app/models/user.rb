class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable

  has_many :created_quests, class_name: 'Quest', foreign_key: 'creator_id' #alias
  has_many :user_quests
  has_many :quests, through: :user_quests
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :user_checkpoints
  has_many :checkpoints, through: :user_checkpoints
  has_many :check_ins
  has_many :locations, through: :check_ins

  before_create :set_defaults

  def set_defaults
    self.total_xp ||= 0
  end


  def self.user_all_checkins(user)
    user.check_ins.map do |checkin| 
      checkin.location 
    end
  end

end
