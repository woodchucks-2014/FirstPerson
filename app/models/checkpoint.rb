class Checkpoint < ActiveRecord::Base
  belongs_to :location
  belongs_to :quest
end
