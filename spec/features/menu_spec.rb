require 'rails_helper'

feature 'User can see menu list on page.' do 
  scenario 'User try to see menu' do 
    type_first = create(:meal_type, kind: 'first')
    type_main = create(:meal_type, kind: 'main')
    type_drink = create(:meal_type, kind: 'drink')

    create(:menu, name: 'Soup', price: 6, meal_type_id: type_first.id)
    create(:menu, name: 'Meat', price: 10, meal_type_id: type_main.id)
    create(:menu, name: 'Tea', price: 3, meal_type_id: type_drink.id)

    visit "/days/#{Date.today.wday}"

    expect(page).to have_content('Soup')
    expect(page).to have_content('Meat')
    expect(page).to have_content('Tea')
  end
end