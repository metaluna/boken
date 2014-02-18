require 'spec_helper'

describe Story do
  subject(:story) { FactoryGirl.build(:story_with_abstract) }
  
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:user_id) }
end