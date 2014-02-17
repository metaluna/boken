require 'spec_helper'

describe User do
  subject { FactoryGirl.build(:user) }
  
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
end
