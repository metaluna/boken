require 'spec_helper'

describe StoriesController do
  context "As a visitor" do
    
    describe "GET index" do
      subject(:stories) { FactoryGirl.create_list(:story, 1) }
      
      it "assigns to @stories" do
        get :index
        expect(assigns(:stories)).to eq stories
      end
      
      it "renders index template" do
        get :index
        expect(response).to render_template "stories/index"
      end
    end
  
    describe "GET show" do
      subject(:story) { FactoryGirl.create(:story) }
      
      it "assigns to @story" do
        get :show, id: story.to_param
        expect(assigns(:story)).to eq story
      end
      
      it "renders show" do
        get :show, id: story.to_param
        expect(response).to render_template "stories/show"
      end
    end

    # --vvv--- BLOCK ACCESS TO THESE ---vvv---
    
    describe "GET new" do
      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end
      
      it "assigns to flash[:alert]" do
        get :new
        expect(flash[:alert]).not_to be_empty
      end
    end
    
    describe "POST create" do
      it "redirects to the login page" do
        post :create, story: FactoryGirl.attributes_for(:story)
        expect(response).to redirect_to "/users/sign_in"
      end
      
      it "assigns to flash[:alert]" do
        post :create, story: FactoryGirl.attributes_for(:story)
        expect(flash[:alert]).not_to be_empty
      end
    end
    
    describe "GET edit" do
      subject(:story) { FactoryGirl.create(:story) }
      
      it "redirects to the login page" do
        get :edit, id: story
        expect(response).to redirect_to "/users/sign_in"
      end
      
      it "assigns to flash[:alert]" do
        get :edit, id: story
        expect(flash[:alert]).not_to be_empty
      end      
    end
    
    describe "PATCH update" do
      subject(:story) { FactoryGirl.create(:story) }
      
      it "redirects to the login page" do
        patch :update, id: story
        expect(response).to redirect_to "/users/sign_in"
      end
      
      it "assigns to flash[:alert]" do
        patch :update, id: story
        expect(flash[:alert]).not_to be_empty
      end
    end
    
    describe "DELETE destroy" do
      subject(:story) { FactoryGirl.create(:story) }
      
      it "redirects to the login page" do
        delete :destroy, id: story
        expect(response).to redirect_to "/users/sign_in"
      end
      
      it "assigns to flash[:alert]" do
        delete :destroy, id: story
        expect(flash[:alert]).not_to be_empty
      end      
    end
    
  end
end