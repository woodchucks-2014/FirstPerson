require 'rails_helper'

RSpec.describe UsersHelper, :type => :helper do

  it "can tell if someone is not logged in" do
    session[:user_id] = nil
    expect(logged_in?).to eq(false)
  end

  it "can tell if someone is logged in" do
    session[:user_id] = 1
    expect(logged_in?).to eq(true)
  end

end
