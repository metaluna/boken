When(/^I start a new game$/) do
  visit '/stories'
  find_link('Play Now').click
end

Then(/^the first scene of the story is shown$/) do
  expect(page).to have_content @story.scenes.first.description
end

Then(/^there is an input field for my commands$/) do
  expect(page).to have_button 'Send'
end

Given(/^a game is running$/) do
  @game = FactoryGirl.create(:game)
end

When(/^I send commands to the game$/) do
  @command_text = "look"
  visit "/games/#{@game.to_param}"
  fill_in 'command[text]', with: @command_text
  click_button 'Send'
end

Then(/^the server's answer is inserted after the last message$/) do
  expect(page).to have_content(@command_text)
end
