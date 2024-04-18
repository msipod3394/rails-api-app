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


    # --------------------------------
    # items / 商品情報
    # --------------------------------
    # 商品情報の取得
    field :items, [Types::ItemType], null: false do
      argument :id, ID, required: false
      argument :field_name, String, required: false
      argument :field_value, String, required: false
    end

    def items(id: nil, field_name: nil, field_value: nil)
      items = Item.includes(:ingredient_items)

      if id
        items = items.where(id: id)
      end

      if field_name && field_value

      end

      items.all
    end


    # --------------------------------
    # ingredients / 具材情報
    # --------------------------------
    # 具材情報の取得
    field :ingredients, [Types::IngredientType], null: false do
      argument :field_name, String, required: false
      argument :field_value, String, required: false
    end

    def ingredients(field_name: nil, field_value: nil)
      if field_name && field_value
        if field_name.downcase == 'id'
          Ingredient.where(id: field_value)
        else
          condition = "#{field_name} = :value"
          Ingredient.where(condition, value: field_value)
        end
      else
        Ingredient.all
      end
    end


    # --------------------------------
    # order / 注文履歴
    # --------------------------------
    # 注文履歴の取得
    field :order, [Types::OrderType], null: false do
      description 'ユーザーIDを指定して検索'
      argument :user_id, String, required: true
    end

    def order(user_id:)
      if user_id
        user = User.find_by(id: user_id)
        if user
          user.orders
        else
          [] # ユーザーが見つからない場合は空のリストを返す
        end
      else
        Order.all
      end
    end


    # --------------------------------
    # favorite / お気に入り
    # --------------------------------
    # お気に入り商品の取得
    field :favorites, [Types::FavoriteType], null: false do
      argument :item_id, String, required: false
      argument :user_id, String, required: false
    end

    def favorites(item_id: nil, user_id: nil)
      if item_id
        Favorite.where(item_id: item_id)
      elsif user_id
        user = User.find_by(id: user_id) # ユーザーのIDで検索する
        return [] unless user
        Favorite.where(user_id: user.id)
      else
        # Favorite.all
      end
    end


    # --------------------------------
    # dislikes / 苦手ネタ
    # --------------------------------
    # 苦手具材の取得
    field :dislikes, [Types::DislikeType], null: false do
      description 'emailを指定して検索'
      argument :user_id, String, required: false
    end

    def dislikes(user_id:)
      if user_id
        user = User.find_by(id: user_id)
        if user
          user.dislikes
        else
          []
        end
      else
        # Dislike.all
      end
    end


    # --------------------------------
    # user / ユーザー登録
    # --------------------------------
    # ユーザー情報の取得
    field :get_user, Types::UserType, null: true do
      argument :email, String, required: true
    end

    def get_user(email:)
      User.find_by(email: email)
    end


  end
end
