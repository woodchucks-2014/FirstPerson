class Checkpoint < ActiveRecord::Base
  belongs_to :location
  belongs_to :quest
  has_many :user_checkpoints
  has_many :users, through: :user_checkpoints
  # accepts_nested_attributes_for :locations
end
