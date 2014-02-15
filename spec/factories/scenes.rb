FactoryGirl.define do
  factory :scene do
    sequence(:description) { |n| "Description #{n}"}
    story
    
    factory :scene_with_triggers do
      ignore do
        triggers_count 1
      end

      after(:create) do |scene, evaluator|
        FactoryGirl.create_list(:trigger, evaluator.triggers_count, scene: scene)
      end        
    end      

  end
end