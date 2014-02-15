Given(/^a game is running$/) do
  @game = FactoryGirl.create(:game)
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
