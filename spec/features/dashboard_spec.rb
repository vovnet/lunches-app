require 'rails_helper'

feature 'User can see weekdays' do 
  context 'Authorized user' do 
    let(:user) { create(:user) }

    scenario 'User can see dashboard' do 
      visit new_user_session_path

      sign_in_user(user)

      visit dashboard_path

      expect(page).to have_content('Mon')
      expect(page).to have_content('Tue')
      expect(page).to have_content('Wed')
      expect(page).to have_content('Thu')
      expect(page).to have_content('Fri')
    end
  end

  context 'Non-authorized user' do 
    scenario 'Guest do not see dashboard' do 
      visit dashboard_path

      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end