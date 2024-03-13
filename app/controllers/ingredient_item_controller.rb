class IngredientItemController < ApplicationController
  def index
  end

  def show
    @ingredientitem = IngredientItem.includes(:ingredient,:item).all
    render json: @ingredientitem, include: [:ingredient,:item]
  end
end
