FactoryGirl.define do
  factory :scene do
    sequence(:description) { |n| "Description #{n}"}
    story
  end
end