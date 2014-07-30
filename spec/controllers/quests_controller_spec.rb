require 'rails_helper'

RSpec.describe QuestsController, :type => :controller do


  describe "GET index" do

    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "returns active quests partial successfully" do
      get :active_quests
      expect(response).to be_success
    end

    it "returns available quests partial successfully" do
      get :available_quests
      expect(response).to be_success
    end

    it "returns completed quests partial successfully" do
      get :completed_quests
      expect(response).to be_success
    end

    it "returns created quests partial successfully" do
      get :created_quests
      expect(response).to be_success
    end

    it "returns sort quests partial successfully" do
      get :sort_quests
      expect(response).to be_success
    end

    it "returns edit quests partial successfully" do
      get :edit_quests
      expect(response).to be_success
    end

    it "returns create quests partial successfully" do
      get :create_quests
      expect(response).to be_success
    end

    it "returns API all method successfully" do
      get :all
      expect(response).to be_success
    end

    it "returns API create method successfully" do
      quest = FactoryGirl.create(:quest)
      params[:quest][:creator_id] = current_user.id 
      get :create
      expect(response).to be_success
    end

    it "returns API set_location method successfully" do
      get :set_location
      expect(response).to be_success
    end

    it "returns API commit_location method successfully" do
      get :commit_location
      expect(response).to be_success
    end

	end
end