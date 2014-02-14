require 'spec_helper'

describe Scene do
  subject { FactoryGirl.build(:scene) }
  
  it { should validate_presence_of :description }
  it { should validate_presence_of :story_id }
end
