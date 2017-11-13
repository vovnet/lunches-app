require 'rails_helper'

feature 'Guest can register. The first user becomes the admin.' do 
  let(:first_user) { User.new(email: 'user1@test.ru', username: 'user1', password: '123456') }
  let(:second_user) { User.new(email: 'user2@test.ru', username: 'user2', password: '123456') }

  before { visit new_user_registration_path }

  scenario 'First registered user becomes admin' do 
    page.fill_in 'user_email', with: first_user.email
    page.fill_in 'user_username', with: first_user.username
    page.fill_in 'user_password', with: first_user.password
    page.fill_in 'user_password_confirmation', with: first_user.password

    page.click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
    expect(User.last.admin?).to eq true
  end

  scenario 'Second registered user do not becomes admin' do 
    User.create!(email: 'u3@test.ru', username: 'nnn', password: '123456')

    page.fill_in 'user_email', with: second_user.email
    page.fill_in 'user_username', with: second_user.username
    page.fill_in 'user_password', with: second_user.password
    page.fill_in 'user_password_confirmation', with: second_user.password

    page.click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
    expect(User.last.admin?).to eq false
  end
end