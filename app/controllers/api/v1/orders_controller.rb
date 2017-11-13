class Api::V1::OrdersController < ApplicationController 
  before_action :doorkeeper_authorize!
  respond_to :json

  def index
    @order = get_record_by_date(Date.today, Order)
    respond_with @order
  end
end