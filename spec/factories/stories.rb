FactoryGirl.define do 
  factory :story do
    sequence(:title) {|n| "Abenteuer #{n}" }
    
    factory :story_with_abstract do
      abstract 'Das groesste Abenteuer aller Zeiten!'
    end
  end
end