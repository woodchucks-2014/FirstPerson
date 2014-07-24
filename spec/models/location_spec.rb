require 'rails_helper'

RSpec.describe Location, :type => :model do
  it {should have_many(:checkpoints)}
  it {should have_many(:quests).through(:checkpoints)}
end
