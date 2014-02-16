Given(/^I am not logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a user exists$/) do
  @username = "testor123"
  @password = "df).ae3$+*Ld"
  @user = FactoryGirl.create(:user, username: @username, 
                          password: @password, password_confirmation: @password)
end

When(/^I enter the wrong password$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter an invalid username$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter the correct credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^an error message about wrong credentials is displayed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a welcome message is displayed$/) do
  pending # express the regexp above with the code you wish you had
end
