class Menu < ApplicationRecord
  belongs_to :meal_type

  def self.get_menu_by_date(date)
    Menu.where(:created_at => date.beginning_of_day..date.end_of_day)
  end

  def self.get_date_for_current_wday(wday)
    wday -= 1
    Date.today.at_beginning_of_week + wday.day
  end
end
