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
  end
end