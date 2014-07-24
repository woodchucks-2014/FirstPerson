class Location < ActiveRecord::Base
  has_many :checkpoints
  has_many :quests, through: :checkpoints
end
