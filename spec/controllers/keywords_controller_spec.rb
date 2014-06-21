require "rails_helper"

describe KeywordsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
   end

   describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
   end


end