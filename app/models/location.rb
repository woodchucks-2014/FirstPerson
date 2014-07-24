class Location < ActiveRecord::Base
  has_many :checkpoints
end
