class OrdersController < ApplicationController
  def new
    date = Menu.get_date_for_current_wday(params[:id].to_i)
    @menu = Menu.get_menu_by_date(date)

    @meals = Array.new
    @menu.each do |m|
      @meals << m.meal_type.kind unless @meals.include? m.meal_type.kind
    end
  end

  def create
    params.permit(:first, :drink, :main)

    @order = Order.new()
    
    @order.first_id = params[:first]
    @order.main_id = params[:main]
    @order.drink_id = params[:drink]
    @order.user = current_user

    if @order.save
      flash[:notice] = "Order processed. Thank you!"
      redirect_to root_path
    else
      flash[:notice] = "Choose three dishes."
      redirect_to request.referrer
    end
  end
end
