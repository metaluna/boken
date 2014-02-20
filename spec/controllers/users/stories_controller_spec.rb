require 'spec_helper'

describe StoriesController do
  context "as a logged in user" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user}
    
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
    
    describe "GET edit" do
      
      context "as the owner of the story" do
        subject(:story) { FactoryGirl.create(:story, user: user) }
        
        it "assigns to @story" do
          get :edit, id: story.to_param
          expect(assigns(:story)).to eq story
        end
        
        it "renders edit" do
          get :edit, id: story.to_param
          expect(response).to render_template "stories/edit"
        end
      end
      
      context "as a player of the story" do
        subject(:story) { FactoryGirl.create(:story) }
        
        it "redirects to the home page" do
          get :edit, id: story.to_param
          expect(response).to redirect_to root_path
        end

        it "assigns to flash[:alert]" do
          get :edit, id: story.to_param
          expect(flash[:alert]).not_to be_nil
        end
      end
    end
    
    describe "POST create" do
      context "with valid parameters" do
        it "creates the story" do
          expect{
            post :create, story: FactoryGirl.attributes_for(:story)
          }.to change(Story, :count).by(1)
        end

        it "assigns to @story" do
          story_attribs = FactoryGirl.attributes_for(:story)
          post :create, story: story_attribs
          expect(assigns(:story)).to be_a(Story)
          expect(assigns(:story).title).to eq story_attribs[:title]
        end
        
        it "redirects to stories#show" do
          post :create, story: FactoryGirl.attributes_for(:story)
          expect(response).to redirect_to Story.last
        end
        
        it "assigns to flash[:success]" do
          post :create, story: FactoryGirl.attributes_for(:story)
          expect(flash[:notice]).not_to be_nil          
        end
      end
      
      context "with invalid parameters" do
        it "does not create the story" do
          expect{
            post :create, story: FactoryGirl.attributes_for(:story, title: "")
          }.not_to change(Story, :count)
        end
        
        it "re-renders the new template" do
          post :create, story: FactoryGirl.attributes_for(:story, title: "")
          expect(response).to render_template "stories/new"
        end
      end
    end
    
    describe "PATCH update" do
      context "as the owner of the story" do
        subject(:story) { FactoryGirl.create(:story, title: "Old Title", user: user) }
        
        context "with valid parameters" do
          
          it "updates the story" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "Changed Title")
            story.reload
            expect(story.title).to eq "Changed Title"
          end
          
          it "assigns to @story" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "Changed Title")
            expect(assigns(:story)).to eq story
          end
          
          it "redirects to the story" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "Changed Title")
            expect(response).to redirect_to story
          end
          
          it "assigns to flash[:success]" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "Changed Title")
            expect(flash[:notice]).not_to be_nil          
          end
        end
        
        context "with invalid parameters" do
          it "does not change the story" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "")
            story.reload
            expect(story.title).to eq "Old Title"
          end
          
          it "re-renders the edit template" do
            patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "")
            expect(response).to render_template "stories/edit"
          end
        end
      end
      
      context "as a player of the story" do
        subject(:story) { FactoryGirl.create(:story, title: "Old Title") }
        
        it "does not change the story" do
          patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story, title: "Changed Title")
          story.reload
          expect(story.title).to eq "Old Title"
        end
        
        it "redirects to the home page" do
          patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story)
          expect(response).to redirect_to root_path
        end

        it "assigns to flash[:alert]" do
          patch :update, id: story.to_param, story: FactoryGirl.attributes_for(:story)
          expect(flash[:alert]).not_to be_nil
        end
      end
    end
    
    describe "DELETE destroy" do
      
      context "as the owner of the story" do
        subject!(:story) { FactoryGirl.create(:story, user: user) }
        
        it "deletes the story" do
          expect {
            delete :destroy, id: story.to_param
          }.to change(Story, :count).by(-1)
        end
        
        it "assigns to flash[:notice]" do
          delete :destroy, id: story.to_param
          expect(flash[:notice]).not_to be_nil
        end
        
        it "redirects to the home page" do
          delete :destroy, id: story.to_param
          expect(response).to redirect_to root_path
        end
        
      end
      
      context "as a player of the story" do
        subject!(:story) { FactoryGirl.create(:story) }
        
        it "does not delete the story" do
          expect {
            delete :destroy, id: story.to_param
          }.not_to change(Story, :count)
        end
        
        it "assigns to flash[:alert]" do
          delete :destroy, id: story.to_param
          expect(flash[:alert]).not_to be_nil
        end
        
        it "redirects to the home page" do
          delete :destroy, id: story.to_param
          expect(response).to redirect_to root_path
        end
        
      end
    end
    
  end
end