require 'spec_helper'

describe StoriesController do
  context "as a user" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user}
    
  end
end