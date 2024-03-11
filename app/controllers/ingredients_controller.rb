class IngredientsController < ApplicationController
  def index
  end

  def show
    # 全てのnetaをjsonで返す
    @ingredients = Ingredient.all
    render json: @ingredients
  end
end
