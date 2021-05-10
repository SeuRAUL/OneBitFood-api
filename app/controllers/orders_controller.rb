class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def create
    @order = Order.new(order_params)
    if @order.save
      @order
    else
      render @order.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :phone_number, :city, :street, :neighborhood, :number, :complement, :restaurant_id, order_products_attributes: [:quantity, :product_id])
    end
end
