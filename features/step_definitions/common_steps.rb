Then(/^an error message is visible$/) do
  expect(page).to have_selector('.alert-error', :count => 1)
end