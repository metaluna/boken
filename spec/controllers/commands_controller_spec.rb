require 'spec_helper'

describe CommandsController do
  
  describe "with valid values" do
    subject(:command) { FactoryGirl.build(:command) }
    
    it "responds on create to ajax" do
      expect{
        xhr :post, :create, game_id: command.game.to_param, command: {text: command.text}
      }.to change(Command, :count).by(1)
    end
  end
  
end