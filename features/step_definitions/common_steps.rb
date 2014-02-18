Then(/^an error message is visible$/) do
  expect(page).to have_selector('.alert-error', :count => 1)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I should not see "(.*?)"$/) do |text|
  expect(page).not_to have_content text
end