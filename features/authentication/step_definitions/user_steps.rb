Given(/^I am not logged in$/) do
  visit '/users/sign_out'
end

Given(/^a user exists$/) do
  @username = "testor123"
  @password = "df).ae3$+*Ld"
  @user = FactoryGirl.create(:user, username: @username, 
                          password: @password, password_confirmation: @password)
end

When(/^I enter the wrong password$/) do
  log_in(@username, @password + "XXX")
end

When(/^I enter an invalid username$/) do
  log_in("#{@username}XXX", @password)
end

When(/^I enter the correct credentials$/) do
  log_in(@username, @password)
end

Then(/^an error message about wrong credentials is displayed$/) do
  expect(page).to have_content('Invalid')
end

Then(/^a welcome message is displayed$/) do
  expect(page).to have_content('successful')
end
