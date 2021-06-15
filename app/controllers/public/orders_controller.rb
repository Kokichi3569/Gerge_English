class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(
      user: current_user,
      payment_method: params[:order][:payment_method])

    # total_paymentに請求額を入れる billingはhelperで定義
    @order.total_payment = billing(@order)
    # 有効かどうかの確認
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.save

    redirect_to thanx_orders_path
  end

  def thanx
  end

  private
  def order_params
    params.require(:order).permit(:name, :total_payment)
  end

end