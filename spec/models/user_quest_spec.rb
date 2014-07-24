require 'rails_helper'

RSpec.describe UserQuest, :type => :model do

  it {should belong_to(:quest)}
  it {should belong_to(:user)}

  pending "it should be completable via the #complete! method."

  pending "the complete method should update a user's total xp."

  pending "validates presence of certain attributes."

end
