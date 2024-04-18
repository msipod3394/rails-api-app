# ユーザー情報

module Types
  class UserType < Types::BaseObject

    field :id, ID, null: false
    field :user_name, String, null: false
    field :email, String, null: false
    field :password, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  end
end
