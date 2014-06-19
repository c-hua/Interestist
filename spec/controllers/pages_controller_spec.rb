require "rails_helper"

describe PagesController do
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

    describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
   end

   describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
   end

end