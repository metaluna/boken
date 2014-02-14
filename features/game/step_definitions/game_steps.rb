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