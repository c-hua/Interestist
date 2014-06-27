require 'rails_helper'

describe SessionsController do
  let :valid_attributes do
    {
      :user_id => @user.id
    }
  end
  

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end

      it "should create a new user" do
        expect do
          post :create, :user => user_params
        end.to change(User, :count).by(1)
      end
  end

  describe "GET 'destroy'" do
    before do
      @user = User.create! valid_attributes
    end

    it "returns destroy success" do
      get 'destroy'
      expect(response).to be_redirect_to root_path
    end
  end

end