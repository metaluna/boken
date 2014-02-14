require 'spec_helper'

describe Command do
  subject { FactoryGirl.build(:command) }
  
  it { should validate_presence_of :game_id }
end
