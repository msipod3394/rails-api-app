class ItemIngredientController < ApplicationController
  def index
  end

  def show
    @itemingredient = ItemIngredient.includes(:item, :ingredient).all
    render json: @itemingredient, include: [:item, :ingredient]
  end
end
