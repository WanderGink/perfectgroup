class OrderItemsController < ApplicationController
  before_action :find_items, only: [:update, :destroy]

  def create
    @order = current_order
    @order_item = @order.order_items.new order_item_params
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html{redirect_to order_url}
      format.js
    end
  end

  def update
    @order = current_order
    @order_item.update_attributes order_item_params
    @order_items = @order.order_items
    respond_to do |format|
      format.html{redirect_to order_url}
      format.js
    end
  end

  def destroy
    @order = current_order
    @order_item.destroy
    @order_items = @order.order_items
    respond_to do |format|
      format.html{redirect_to order_url}
      format.js
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit :id, :quantity, :product_id
  end

  def find_items
    @order = current_order
    @order_item = @order.order_items.find_by id: params[:id]
    unless @order_item
      flash[:danger] = t "danger"
      redirect_to root_url
    end
  end
end
