FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "User#{n}"}
    email { "#{username}@example.com".downcase}
    password 'supersecret'
    password_confirmation 'supersecret'
  end
end