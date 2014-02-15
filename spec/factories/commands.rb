FactoryGirl.define do
  factory :command do
    sequence(:text) { |n| "Command #{n}"}
    game
  end
end