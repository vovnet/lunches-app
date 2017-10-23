class AddMealTypeIdToMenus < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :menus, :meal_type, foreign_key: true
  end
end
