require 'spec_helper'

describe HistoryEntry do
  subject { FactoryGirl.build(:history_entry) }
  
  it { should validate_presence_of :game_id }
  it { should validate_presence_of :scene_id }
end
