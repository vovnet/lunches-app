require 'rails_helper'

feature 'User can make order' do 
  let(:user) { create(:user) }
  scenario 'User create new order' do 
    create_menu
    
    visit new_user_session_path

    sign_in_user(user)

    visit  "orders/#{Date.current.wday}"

    page.choose "first_#{@first.id}"
    page.choose "main_#{@main.id}"
    page.choose "drink_#{@drink.id}"

    page.click_button 'Complete'

    expect(page).to have_content 'Order processed'
  end
end