FactoryGirl.define do 
  factory :story do
    sequence(:title) {|n| "Abenteuer #{n}" }
    
    factory :story_with_abstract do
      abstract 'Das groesste Abenteuer aller Zeiten!'
      
      factory :story_with_scenes do
        
        ignore do
          scenes_count 3
        end
        
        after(:create) do |story, evaluator|
          FactoryGirl.create_list(:scene, evaluator.scenes_count, story: story)
        end
        
      end
      
    end
    
  end
end