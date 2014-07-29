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
    @checkin_locs=[]
    user.check_ins.each do |check_in|
      @checkin_locs << Location.find(check_in.location_id)
    end
    return @checkins_locs
  end

  def self.checkin_points_all(user)
    @checkins = user.check_ins
    return @checkins_locs
  end

end
