module ApplicationHelper
  def get_record_by_date(date, model)
    model.where(:created_at => date.beginning_of_day..date.end_of_day)
  end

  def get_date_for_current_wday(wday)
    wday -= 1
    Date.today.at_beginning_of_week + wday.day
  end
end
