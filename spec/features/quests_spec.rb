require 'rails_helper'

feature "Quests", :type => :feature do
  describe "User Quests page" do

    it "renders the quest list" do
      visit '/quests'
      expect(page).to have_css(".list")
    end

    it "renders 'Here are your quests!'" do
      visit '/quests'
      expect(page).to have_content("Here are your quests!")
    end

    it "renders side menu" do
      visit '/quests'
      expect(page).to have_css('div#options.sidebar')
    end

    it "renders 'Your Active Quests' button" do
      visit '/quests'
      expect(page).to have_css('div#active_but.button')
    end

    it "renders quest content area" do
      visit '/quests'
      expect(page).to have_css('div#content')
    end

    it "lists quest info " do
      visit '/quests'
      expect(page).to have_css('div.list')
    end

    # it "renders title field " do
    #   visit '/quests'
    #   expect(page).to have_css('input#quest_title')
    # end

    # it "renders title field " do
    #   visit '/quests'
    #   expect(page).to have_css('input#quest_title')
    # end

    # it "renders description field " do
    #   visit '/quests'
    #   expect(page).to have_css('textarea#quest_description')
    # end

    # it "renders user limit field " do
    #   visit '/quests'
    #   expect(page).to have_css('input#quest_user_limit')
    # end

    # it "renders category field " do
    #   visit '/quests'
    #   expect(page).to have_css('input#quest_category')
    # end

    # it "renders quest end date field " do
    #   visit '/quests'
    #   expect(page).to have_css('input#quest_end_date')
    # end

    # it "renders 'Add your checkpoints' button" do
    #   visit '/quests'
    #   expect(page).to have_css('input[name="commit"][type="submit"][value="Add your checkpoints!"]')
    # end

  end
  
end