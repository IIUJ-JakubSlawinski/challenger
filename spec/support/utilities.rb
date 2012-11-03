include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  #For no-capybara
  cookies[:remember_token] = user.remember_token
end

def fill_user_info_form(name, email, password, password_confirmation=nil)
  fill_in "Name", with: name
  fill_in "Email", with: email
  fill_in "Password", with: password
  if(password_confirmation)
    fill_in "Confirmation", with: password_confirmation
  else
    fill_in "Confirmation", with: password
  end
end