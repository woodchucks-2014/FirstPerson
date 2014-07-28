require 'rails_helper'

RSpec.describe UserCheckpoint, :type => :model do
  it {should belong_to(:user)}
  it {should belong_to(:checkpoint)}

  it "marks a user_checkpoint as completed" do
    user_point = FactoryGirl.build(:user_checkpoint)
    user_point.complete!
    expect(user_point.completed).to eq(true)
  end
end
