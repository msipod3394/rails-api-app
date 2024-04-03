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
        # フィールド名とフィールド値を使用して検索するロジックを追加することができます
        # 例えば、field_name が "name" で field_value が "example" の場合は以下のようになります
        # items = items.where("name = ?", field_value)
      end

      items.all
    end



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


    # 注文履歴の取得
    field :orders, [Types::OrderType], null: false do
      argument :field_name, String, required: false
      argument :field_value, String, required: false
    end

    def orders(field_name: nil, field_value: nil)
      if field_name && field_value
        if field_name.downcase == 'id'
          Order.where(id: field_value)
        else
          condition = "#{field_name} = :value"
          Order.where(condition, value: field_value)
        end
      else
        Order.all
      end
    end


    # ユーザー情報の取得
    field :users, [Types::UserType], null: false do
      argument :field_name, String, required: false
      argument :field_value, String, required: false
    end

    def users(field_name: nil, field_value: nil)
      if field_name && field_value
        if field_name.downcase == 'id'
          User.where(id: field_value)
        else
          condition = "#{field_name} = :value"
          User.where(condition, value: field_value)
        end
      else
        User.all
      end
    end


    # お気に入り商品の取得
    field :favorites, [Types::FavoriteType], null: false do
      argument :user_id, ID, required: false
      argument :email, String, required: false
    end

    def favorites(user_id: nil, email: nil)
      ## ユーザーのIDから取得
      if user_id
        Favorite.where(user_id: user_id)

      ## ユーザーのemailから取得
      elsif email
      user = User.find_by(email: email)
      return [] unless user
      Favorite.where(user_id: user.id)

      ## 引数がなければ全件取得
      else
        Favorite.all
      end
    end

    # 苦手具材の取得
    field :dislikes, [Types::DislikeType], null: false do
      argument :user_id, ID, required: false
      argument :email, String, required: false
    end

    def dislikes(user_id: nil, email: nil)
      ## ユーザーのIDから取得
      if user_id
        Dislike.where(user_id: user_id)

      ## ユーザーのemailから取得
      elsif email
      user = User.find_by(email: email)
      return [] unless user
      Dislike.where(user_id: user.id)

      ## 引数がなければ全件取得
      else
        Dislike.all
      end
    end




  end
end
