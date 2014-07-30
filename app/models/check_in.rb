class CheckIn < ActiveRecord::Base
  include CheckInsHelper

	belongs_to :user
	belongs_to :location

  before_create :set_defaults
  after_create :check_in_xp

  def set_defaults
    self.xp ||= 0
  end


end
