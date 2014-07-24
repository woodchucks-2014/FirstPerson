require 'rails_helper'

RSpec.describe Checkpoint, :type => :model do
  it {should belong_to(:location)}
  it {should belong_to(:quest)}
  it {should have_many(:user_checkpoints)}
  it {should have_many(:users).through(:user_checkpoints)}
end
