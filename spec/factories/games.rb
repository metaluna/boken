FactoryGirl.define do
  factory :game do
    association :story, factory: :story_with_scenes, strategy: :create
    user
    
    factory :finished_game do
      finished true
    end
  end
end