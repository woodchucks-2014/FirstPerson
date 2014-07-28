require 'rails_helper'

feature "Quests", :type => :feature do
	describe "User Quests page" do

	  it "renders the quest title div" do
	  	visit '/quests'
	  	expect(page).to have_content("Create a quest")
	  end

	  it "renders the quest list" do
	  	visit '/quests'
	  	expect(page).to have_css(".list")
	  end

	  it "renders 'Here are your quests!'" do
	  	visit '/quests'
	  	expect(page).to have_content("Here are your quests!")
	  end

	  it "renders 'Create a quest' Form" do
	  	visit '/quests'
	  	expect(page).to have_css('.create')
	  end

	  it "renders the map" do
	  	visit '/quests'
	  	expect(page).to have_css('div#map')
	  end

	  it "renders the map" do
	  	visit '/quests'
	  	expect(page).to have_css('div#map')
	  end

	  it "renders fields in 'Create a quest' " do
	  	visit '/quests'
	  	expect(page).to have_css('.new_quest')
	  end

	  it "renders title field " do
	  	visit '/quests'
	  	expect(page).to have_css('input#quest_title')
	  end

	  it "renders title field " do
	  	visit '/quests'
	  	expect(page).to have_css('input#quest_title')
	  end

	  it "renders description field " do
	  	visit '/quests'
	  	expect(page).to have_css('textarea#quest_description')
	  end


	  
	end
end
