require 'spec_helper'

describe Game do
  
  describe 'with minimal valid values' do
    subject { FactoryGirl.build(:game) }
  
    it { should validate_presence_of :story_id }
  end
  
  describe 'with scenes' do
    subject(:game) { FactoryGirl.create(:game) }
    
    it 'has the first scene in its history' do
      expect(game.history_entries.first.scene).to eq(game.story.scenes.first)
    end
  end
end
