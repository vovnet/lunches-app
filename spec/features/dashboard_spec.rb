require 'rails_helper'

feature 'User can see weekdays' do 
  scenario 'Guest try to see dashboard page' do 
    visit dashboard_path
    expect(page).to have_content('Mon')
    expect(page).to have_content('Tue')
    expect(page).to have_content('Wed')
    expect(page).to have_content('Thu')
    expect(page).to have_content('Fri')
  end
end