module ItemsMacros
  def create_menu
    @first_meal = MealType.create!(kind: 'first')
    @main_meal = MealType.create!(kind: 'main')
    @drink_meal = MealType.create!(kind: 'drink')

    @first = Menu.create!(name: 'soup', price: 5, meal_type: @first_meal)
    @main = Menu.create!(name: 'meat', price: 8, meal_type: @main_meal)
    @drink = Menu.create!(name: 'juice', price: 2, meal_type: @drink_meal)
  end
end