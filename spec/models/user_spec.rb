require 'rails_helper'

RSpec.describe User, :type => :model do
  it {should have_many(:created_quests).class_name('Quest').with_foreign_key('creator_id')}
  it {should have_many(:user_quests)}
  it {should have_many(:quests).through(:user_quests)}
  it {should have_many(:user_rewards)}
  it {should have_many(:rewards).through(:user_rewards)}
  it {should have_many(:user_checkpoints)}
  it {should have_many(:checkpoints).through(:user_checkpoints)}
  it {should have_many(:check_ins)}
  it {should have_many(:locations).through(:check_ins)}
end
