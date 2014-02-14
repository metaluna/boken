FactoryGirl.define do
  factory :game do
    association :story, factory: :story_with_scenes, strategy: :create
  end
end