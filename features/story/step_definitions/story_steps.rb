Given(/^a story exists$/) do
  @story = FactoryGirl.create(:story)
end

Given(/^a story with scenes exists$/) do
  @story = FactoryGirl.create(:story_with_scenes)
end

When(/^I create a new story$/) do
  @story = FactoryGirl.build(:story_with_abstract)
  visit '/stories/new'
  fill_in 'Title', with: @story.title
  fill_in 'Abstract', with: @story.abstract
  click_button 'Create Story'
end

When(/^I create a new story without a title$/) do
  visit '/stories/new'
  click_button 'Create Story'
end

When(/^I change the title$/) do
  @new_title = "Adventures on Rails"
  visit '/stories'
  find_link('Edit').click
  fill_in 'Title', with: @new_title
  click_button 'Update Story'
end

When(/^I delete the title$/) do
  visit '/stories'
  find_link('Edit').click
  fill_in 'Title', with: ''
  click_button 'Update Story'
end

When(/^I change the title to one already existing$/) do
  visit '/stories/new'
  fill_in 'Title', with: @story.title
  click_button 'Create Story'
end

When(/^I delete the story$/) do
  visit "/stories/#{@story.to_param}"
  find_link('Delete').click
end

Then(/^the story is listed on the homepage$/) do
  expect(page).to have_content @story.title
  expect(page).to have_content @story.abstract
end

Then(/^the changed title is visible$/) do
  expect(page).to have_content @new_title
end

Then(/^the story is not visible$/) do
  expect(page).not_to have_content @story.title
end
