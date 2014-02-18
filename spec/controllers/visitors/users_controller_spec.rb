require 'spec_helper'

describe UsersController do
  
  describe "GET index" do
    it "blocks access" do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end
  end
  
  describe "GET show" do
    let!(:user) { FactoryGirl.create(:user) }
    
    it "assigns to @user" do
      get :show, {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end
  
end