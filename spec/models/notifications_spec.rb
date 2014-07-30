require 'rails_helper'

RSpec.describe Notification, :type => :model do

  it {should belong_to(:user)}

  it "Can make a hash of itself" do
    notice = Notification.new(title: "Checkpoint Completed!", content: "You've completed the Create Notifications Quest.")
    expect(notice.to_js).to eq({title: "Checkpoint Completed!", content: "You've completed the Create Notifications Quest."})
  end

end