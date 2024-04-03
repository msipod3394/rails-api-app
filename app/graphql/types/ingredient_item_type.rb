# module Types
#   class IngredientItemType < GraphQL::Schema::Object
#     field :id, ID, null: false
#     field :name, String, null: false

#     # フィールド`name`の解決メソッド
#     def name
#       object.ingredient.name
#     end
#   end
# end

# app/graphql/types/ingredient_item_type.rb
module Types
  class IngredientItemType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :name, String, null: false
  end
end
