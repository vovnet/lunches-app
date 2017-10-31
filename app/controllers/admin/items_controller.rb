class Admin::ItemsController < Admin::AdminBaseController
  def new
    @item = Menu.new
  end

  def create
    @item = Menu.new(menu_params)

    if @item.save
      flash[:notice] = "Item successfully added!"
      redirect_to action: "index"
    else
      redirect_to request.referrer
    end
  end

  def index
    @items = get_record_by_date(Date.current, Menu)
  end

  protected

  def menu_params
    params.require(:menu).permit(:name, :price, :meal_type_id)
  end
end