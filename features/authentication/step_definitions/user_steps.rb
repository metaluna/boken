Given(/^I am not logged in$/) do
  visit '/users/sign_out'
end

Given(/^a user exists$/) do
  @username = "testor123"
  @password = "df).ae3$+*Ld"
  @user = FactoryGirl.create(:user, username: @username, 
                          password: @password, password_confirmation: @password)
end

Given(/^I am logged in as a user$/) do
  @user = FactoryGirl.create(:user)
  log_in(@user.username, @user.password)
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

When(/^I register with complete data$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, @user.email, @user.password, @user.password)
end

When(/^I try to register without a username$/) do
  @user = FactoryGirl.build(:user)
  register_user("", @user.email, @user.password, @user.password)
end

When(/^I try to register without an email$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, "", @user.password, @user.password)  
end

When(/^I try to register without a password$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, @user.email, "", @user.password)
end

When(/^I try to register without a password confirmation$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, @user.email, @user.password, "")
end

When(/^I try to register with non\-matching password confirmation$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, @user.email, @user.password, "#{@user.password}XXX")
end

When(/^I try to register with an invalid email address format$/) do
  @user = FactoryGirl.build(:user)
  register_user(@user.username, "aaa", @user.password, @user.password)  
end

When(/^I try to go to the registration page$/) do
  visit '/users/sign_up'
end

When(/^I try to register with an existing username$/) do
  @user1 = FactoryGirl.create(:user)
  @user2 = FactoryGirl.build(:user)
  register_user(@user1.username, @user2.email, @user2.password, @user2.password)
end

When(/^I try to register with an existing email address$/) do
  @user1 = FactoryGirl.create(:user)
  @user2 = FactoryGirl.build(:user)
  register_user(@user2.username, @user1.email, @user2.password, @user2.password)
end

Then(/^an error message is displayed$/) do
  expect(page).to have_content('error')
end

Then(/^an error message about wrong credentials is displayed$/) do
  expect(page).to have_content('Invalid')
end

Then(/^an error message about being already signed in is displayed$/) do
  expect(page).to have_content(I18n.t('devise.failure.already_authenticated'))
end

Then(/^a welcome message is displayed$/) do
  expect(page).to have_content('successful')
end

Then(/^I am redirected to the homepage$/) do
  expect(page).to have_content('Adventures')
end
