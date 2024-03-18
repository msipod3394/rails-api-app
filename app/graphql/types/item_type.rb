# 商品情報

module Types
  class ItemType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: false
    field :image, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  end
end
