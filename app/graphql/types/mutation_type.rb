# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    # 注文履歴登録
    field :create_order, Types::OrderType, null: false do
      # 引数
      argument :item_id, String, required: true
      argument :user_id, String, required: true
    end

    def create_order(item_id:, user_id:)
      # 新しい注文を作成する関数
      Order.create(item_id: item_id, user_id: user_id)
    end


    # お気に入り登録
    field :create_favorite, Types::FavoriteType, null: false do
      # 引数
      argument :item_id, String, required: true
      argument :user_id, String, required: true
    end

    def create_favorite(item_id:, user_id:)
      # 新しいお気に入りを作成する関数
      Favorite.create(item_id: item_id, user_id: user_id)
    end

    # 苦手ネタ登録
    field :create_dislike, Types::DislikeType, null: false do
      # 引数
      argument :ingredient_id, ID, required: true
      argument :email, String, required: true
    end

    def create_dislike(ingredient_id:, email:)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "指定されたメールアドレスに対応するユーザーが見つかりませんでした。"
      end

      # 苦手ネタを作成する
      dislike = Dislike.create(ingredient_id: ingredient_id, user: user)

      dislike
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("指定された食材が見つかりませんでした。")
    end


    # 苦手ネタ削除
    field :deleteDislike, mutation: Mutations::DeleteDislike

    def delete_dislike(ingredient_id:, email:)
      # 苦手ネタ削除関数
      Dislike.delete(ingredient_id: ingredient_id, email: email)
    end


    # ユーザー登録
    field :create_user, Types::UserType, null: false do
      # 引数
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def create_user(email:, password:)
      # 新しいユーザーを登録する関数
      User.create(email: email, password: password)
    end

  end
end
