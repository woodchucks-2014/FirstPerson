class Location < ActiveRecord::Base
  has_many :checkpoints
  has_many :quests, through: :checkpoints
  has_many :check_ins
  has_many :users, through: :check_ins

  after_validation :add_address
  geocoded_by :address
  before_create :geocode

  private

  def add_address
    self.address = [self.street, self.city, self.state, self.zip].join(', ')
  end

end
