class CreateMealTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_types do |t|
      t.string :kind
      t.timestamps
    end
  end
end
