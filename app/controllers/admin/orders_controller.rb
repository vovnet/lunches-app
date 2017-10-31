class Admin::OrdersController < Admin::AdminBaseController
  def show
    date = get_date_for_current_wday(params[:id].to_i)
    @orders = get_record_by_date(date, Order)
  end
end