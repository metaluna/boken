Given(/^a user named "(.*?)" exists$/) do |username|
  FactoryGirl.create(:user, username: username)
end

Given(/^a user named "(.*?)" has created the story "(.*?)"$/) do |username, storyname|
  FactoryGirl.create(:story, title: storyname, user: User.find_by(username: username.downcase))
end

Given(/^a user named "(.*?)" has finished the story "(.*?)"$/) do |username, storyname|
  user = User.find_by! username: username.downcase
  story = Story.find_by! title: storyname
  FactoryGirl.create(:finished_game, story: story, user: user)
end

When(/^I look at the user page of "(.*?)"$/) do |username|
  user = User.find_by! username: username.downcase
  visit "/users/#{user.to_param}"
end

When(/^I look at my user page$/) do
  visit "/users/#{@user.to_param}"
end
