FactoryGirl.define do
  factory :trigger do
    sequence(:text) { |n| "trigger_#{n}"}
    scene
    association :target, factory: :scene
  end
end