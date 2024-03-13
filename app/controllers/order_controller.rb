class OrderController < ApplicationController
  def index
  end

  def show
    @orders = Order.includes(:item, :user).all
    render json: @orders, include: [:item, :user]
  end
end
