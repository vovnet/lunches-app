require 'rails_helper'

feature 'User can see menu list of current day' do 
  let(:user) { create(:user) }

  scenario 'User see menu' do 
    create_menu
    
    visit new_user_session_path

    sign_in_user(user)

    visit dashboard_path

    page.click_link 'Mon'

    expect(page).to have_content @first.name
    expect(page).to have_content @first.price
    expect(page).to have_content @main.name
    expect(page).to have_content @main.price
    expect(page).to have_content @drink.name
    expect(page).to have_content @drink.price
  end
end