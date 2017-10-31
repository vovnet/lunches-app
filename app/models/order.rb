class Order < ApplicationRecord
  belongs_to :user

  validates :first_id, :main_id, :drink_id, presence: true

  attr_accessor :items

  def load_items
    if @items.nil?
      @items = []
      @items << Menu.find(first_id)
      @items << Menu.find(main_id)
      @items << Menu.find(drink_id)
    end
  end

  def get_total_cost
    cost = 0
    @items.each do |item|
      cost += item.price
    end
    cost
  end

  def self.total_orders_cost(orders)
    cost = 0
    orders.each do |order|
      order.load_items
      cost += order.get_total_cost
    end
    cost
  end
end
