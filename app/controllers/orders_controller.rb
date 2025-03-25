class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.order.nil? && @item.user_id != current_user.id
      @order_buyer = OrderBuyer.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :street_address, :building, :telephone).merge(item_id: @item.id, user_id: current_user.id)
  end



end