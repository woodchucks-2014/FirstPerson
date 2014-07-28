class Location < ActiveRecord::Base
  has_many :checkpoints
  has_many :quests, through: :checkpoints
  has_many :check_ins
  has_many :users, through: :check_ins

  geocoded_by :address
  after_validation :geocode
end
