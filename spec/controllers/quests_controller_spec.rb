require 'rails_helper'

RSpec.describe QuestsController, :type => :controller do

	describe 'Quests Page' do
	  it "returns http successfully" do
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
	end
end
