class DaysController < ApplicationController

  def show
    date = Menu.get_date_for_current_wday(params[:id].to_i)
    @menu = Menu.get_menu_by_date(date)

    @meals = Array.new
    @menu.each do |m|
      @meals << m.meal_type.kind unless @meals.include? m.meal_type.kind
    end
  end
end
