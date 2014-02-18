require 'spec_helper'

describe StoriesController do
  context "As a user" do
    let!(:user) { FactoryGirl.create(:user) }
    before { sign_in user}
    
    describe "GET play" do
      
      before { get :play, {id: story.to_param} }
      let!(:story) { FactoryGirl.create(:story_with_scenes) }
      
      it "assigns to @story" do
        expect(assigns(:story)).to eq(story)
      end
      
      it "assigns to @game" do
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end
      
      it "sets the user as the owner" do
        expect(assigns(:game).user).to eq(user)
      end
      
      it "redirects to game#show" do
        expect(response).to redirect_to game_path
      end
    end
  end
end