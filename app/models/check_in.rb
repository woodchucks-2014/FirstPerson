class CheckIn < ActiveRecord::Base
  include CheckInsHelper

	belongs_to :user
	belongs_to :location

  before_create :add_location
  after_create :check_in_xp

  # validates_with :distance_and_time

  def add_location
    # code for creating a new location given coordinates from 4square goes here
    # loc = Location.find_or_create_by(location_params)
    # self.location_id = loc.id
  end

  # def distance_and_time
  #   if distance_since_last_checkin < 500 || time_since_last_checkin < 3600 # seconds
  #     errors.add(:location, "You're too close to your last checkin, go to a new location or wait an hour")
  #   end
  # end

end
