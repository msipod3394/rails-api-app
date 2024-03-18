# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"

    # def test_field
    #   "Hello test"
    # end

    # 商品情報の取得
    field :items, [Types::ItemType], null: false
    def items
      Item.all
    end

    # 具材情報の取得
    field :ingredients, [Types::IngredientType], null: false
    def ingredients
      Ingredient.all
    end

    # 注文履歴の取得
    field :orders, [Types::OrderType], null: false
    def orders
      Order.all
    end

    # ユーザー情報の取得
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    # お気に入り商品の取得
    field :favorites, [Types::FavoriteType], null: false
    def favorites
      Favorite.all
    end

    # 苦手具材の取得
    field :dislikes, [Types::DislikeType], null: false
    def dislikes
      Dislike.all
    end

  end
end
