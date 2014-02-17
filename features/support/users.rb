module Users
  def log_in(username, password)
    visit '/users/sign_in'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Login'
  end
  
  def register_user(username, email, password, password_confirmation)
    visit '/users/sign_up'
    fill_in User.human_attribute_name(:username), with: username
    fill_in User.human_attribute_name(:email), with: email
    fill_in User.human_attribute_name(:password), with: password
    fill_in User.human_attribute_name(:password_confirmation), with: password_confirmation
    click_button 'Register'
  end
end

World(Users)