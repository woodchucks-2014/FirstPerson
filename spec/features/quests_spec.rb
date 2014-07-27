require 'rails_helper'

feature "Quests", :type => :feature do
	describe "User Quests page" do
	  it "renders the nav bar" do
	  	visit '/quests'
	  	expect(page).to have_css(".quest_title")
	  end

	  it "renders the quest list" do
	  	visit '/quests'
	  	expect(page).to have_css(".list")
	  end
	end
end
