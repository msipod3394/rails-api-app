# 商品情報

# module Types
#   class ItemType < GraphQL::Schema::Object
#     field :id, ID, null: false
#     field :name, String, null: false
#     field :ingredients, [IngredientItemType], null: false

#     def ingredients
#       object.ingredients
#     end
#   end
# end

module Types
  class ItemType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :name, String, null: false
    field :image, String, null: false
    field :ingredients, [Types::IngredientItemType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def ingredients
      object.ingredients
    end
  end
end
