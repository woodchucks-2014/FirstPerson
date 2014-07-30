require 'rails_helper'

RSpec.describe CheckIn, :type => :model do
  it {should belong_to(:location)}
  it {should belong_to(:user)}

  it "sets a user's xp at a check-in to a default of 0" do
    puts "\n\n\n\n********************\n\n\n\n"
    ex = FactoryGirl.build(:check_in)
    ex.set_defaults
    expect(ex.xp).to eq(0)
  end

end
