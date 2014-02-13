When(/^I create a new story$/) do
  @story = FactoryGirl.build(:story_with_abstract)
  visit '/stories/new'
  fill_in 'Title', with: @story.title
  fill_in 'Abstract', with: @story.abstract
  click_button 'Create Story'
end

Then(/^the story is listed on the homepage$/) do
  expect(page).to have_content @story.title
  expect(page).to have_content @story.abstract
end