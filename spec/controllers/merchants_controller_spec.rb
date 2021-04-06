require 'rails_helper'

describe MerchantsController, type: :controller do
  let!(:merchant1) { FactoryBot.create :merchant }
  let!(:merchant2) { FactoryBot.create :merchant }

  describe "GET #index" do
  	it "should return all merchants when params is nil" do
      get :index

      expect(assigns["merchants"]).to eq([merchant1, merchant2])
  	end

    it "should return merchant1" do
      get :index, params: {search: merchant1.name}

      expect(assigns["merchants"]).to eq([merchant1])
    end

    it "should return empty array" do
      get :index, params: {search: "unknown_name"}

      expect(assigns["merchants"]).to eq([])
    end
  end
end