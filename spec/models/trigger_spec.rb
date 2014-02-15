require 'spec_helper'

describe Trigger do
  subject { FactoryGirl.build(:trigger) }
  
  it { should validate_presence_of :text }
  it { should validate_presence_of :scene_id }
  it { should validate_presence_of :target_id }
end
