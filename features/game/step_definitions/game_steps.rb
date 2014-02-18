Given(/^a game is running$/) do
  @game = FactoryGirl.create(:game)
end

Given(/^a user named "(.*?)" started playing "(.*?)"$/) do |username, storyname|
  user = User.find_by! username: username.downcase
  story = Story.find_by! title: storyname
  FactoryGirl.create(:game, story: story, user: user)
end

When(/^I start a new game$/) do
  start_playing @story
end

When(/^I send commands to the game$/) do
  @command_text = "look"
  submit_command @game, @command_text
end

When(/^I send a valid option$/) do
  @trigger = @game.story.scenes.first.triggers.first
  @command_text = @trigger.text
  submit_command @game, @command_text
end

When(/^I start a new game of "(.*?)"$/) do |storyname|
  story = Story.find_by! title: storyname
  start_playing story
end

Then(/^the first scene of the story is shown$/) do
  expect(page).to have_content @story.scenes.first.description
end

Then(/^there is an input field for my commands$/) do
  expect(page).to have_button 'Send'
end

Then(/^the server's answer is inserted after the last message$/) do
  expect(page).to have_content(@command_text)
end

Then(/^the next scene is displayed$/) do
  expect(page).to have_content(@trigger.target.description)
end
