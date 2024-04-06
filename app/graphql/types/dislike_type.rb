# 苦手ネタ

module Types
  class DislikeType < Types::BaseObject

    field :id, ID, null: false
    field :ingredient, Types::IngredientType, null: false
    field :user, Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Dislikeオブジェクトがingredientを持っていない場合はnilを返す
    def ingredient
      return object.ingredient if object.respond_to?(:ingredient)
      nil
    end

  end
end
