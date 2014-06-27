require 'rails_helper'

describe NewsController do
		let :valid_keyword do
		{
			keyword: "usa"
		}
	end

  describe "GET #index" do

		before do
			@keyword = params[:keyword]
			get :index
		end

		before do
     	@searchusa1 = Page.party valid_keyword
			get :index
		end

		before do
     @tag1 = Instagram.tag_recent_media valid_keyword
			get :index
		end

		before do
			@s = params[:keyword]
   		get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end