module UserMacros
  def sign_in_user(user)
    page.fill_in 'user_email', with: user.email
    page.fill_in 'user_password', with: user.password
    page.click_button 'Log in'
  end
end