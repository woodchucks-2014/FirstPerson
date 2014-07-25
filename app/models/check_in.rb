class CheckIn < ActiveRecord::Base
  include CheckInsHelper

	belongs_to :user
	belongs_to :location

  after_create :check_in_xp
end
