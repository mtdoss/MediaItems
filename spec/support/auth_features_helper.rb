module AuthFeaturesHelper
  def sign_up_as(username)
    visit new_user_url
    fill_in "user[username]", with: username
    fill_in "user[password]", with: "password"
    click_button "Sign Up"
  end

  def login_as(user)
    visit new_session_url
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: "password"
    click_button "Log In"
  end
end
