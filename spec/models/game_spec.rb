require 'spec_helper'

describe Game do
  
  context 'with minimal valid values' do
    subject { FactoryGirl.build(:game) }
  
    it { should validate_presence_of :story_id }
  end
  
  context 'with scenes' do
    subject(:game) { FactoryGirl.create(:game) }
    
    it 'has the first scene as the current scene' do
      expect(game.current_scene).to eq(game.story.scenes.first)
    end
    
    it 'has the first scene in its history' do
      expect(game.history_entries.first.scene).to eq(game.story.scenes.first)
    end
    
    describe 'on execute' do
      
      it 'returns the error scene with an invalid command' do
        expect(game.execute('hjkl')).to be_a ErrorScene
      end
      
      context 'of a valid command' do
        let!(:trigger) { game.story.scenes.first.triggers.first }
        
        it 'returns the next scene' do
          expect(game.execute(trigger.text)).to eq trigger.target
        end

        it 'adds the scene to the history' do
          expect {
            game.execute(trigger.text)
          }.to change(game.history_entries, :count).by(1)
        end
      end
    end
  end
  
  describe "with scope finished" do
    context "having a finished game" do
      let!(:finished_game) { FactoryGirl.create(:finished_game) }
      let!(:unfinished_game) { FactoryGirl.create(:game)}
      
      it "finds the finished game" do
        games = Game.finished
        expect(games.count).to eq 1
        expect(games).to include finished_game
      end
      
    end
    context "having no finished games" do
      let!(:unfinished_game) { FactoryGirl.create(:game) }
      
      it "finds no games" do
        expect(Game.finished.count).to eq 0
      end
    end
  end
  
    describe "with scope unfinished" do
    context "having an unfinished game" do
      let!(:finished_game) { FactoryGirl.create(:finished_game) }
      let!(:unfinished_game) { FactoryGirl.create(:game)}
      
      it "finds the unfinished game" do
        games = Game.unfinished
        expect(games.count).to eq 1
        expect(games).to include unfinished_game
      end
      
    end
    context "having no unfinished games" do
      let!(:finished_game) { FactoryGirl.create(:finished_game) }
      
      it "finds no games" do
        expect(Game.unfinished.count).to eq 0
      end
    end
  end
  
end
