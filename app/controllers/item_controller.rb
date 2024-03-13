class ItemController < ApplicationController
  def index
  end

  def show
    # 全てのitemをjsonで返す
    @items = Item.all
    render json: @items
  end
end
