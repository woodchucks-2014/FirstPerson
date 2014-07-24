require 'rails_helper'

RSpec.describe UserQuest, :type => :model do
  it {should belong_to(:quest)}
  it {should belong_to(:user)}
end
