class ProductController < ApplicationController
  def index
  end

  def show
    # 全てのdonをjsonで返す
    @products = Product.all
    render json: @products
  end
end
