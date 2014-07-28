require 'rails_helper'

feature "Quests", :type => :feature do
	describe "User Quests page" do

		it "gives a 200 status code" do
      visit '/'
      expect(page.status_code).to eq(200)
    end

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

	  it "renders user limit field " do
	  	visit '/quests'
	  	expect(page).to have_css('input#quest_user_limit')
	  end

	  it "renders category field " do
	  	visit '/quests'
	  	expect(page).to have_css('input#quest_category')
	  end

	  it "renders quest end date field " do
	  	visit '/quests'
	  	expect(page).to have_css('input#quest_end_date')
	  end

	  it "renders 'Add your checkpoints' button" do
	  	visit '/quests'
	  	expect(page).to have_css('input[name="commit"][type="submit"][value="Add your checkpoints!"]')
	  end

	  


	  
	end
end
