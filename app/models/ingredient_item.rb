class IngredientItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :item
end

