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



    # --------------------------------
    # favorite / お気に入り
    # --------------------------------

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


    # お気に入り登録（配列）
    field :create_favorites, [Types::FavoriteType], null: false do
      # 引数
      argument :item_ids, [String], required: true
      argument :email, String, required: true
    end

    def create_favorites(item_ids:, email:)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "指定されたメールアドレスに対応するユーザーが見つかりませんでした。"
      end

      favorites = []

      # 各 item_id に対して処理を行う
      item_ids.each do |item_id|
        begin
          # 苦手ネタを作成する
          favirite = Favorite.create(item_id: item_id, user: user)
          favorites << favirite
        rescue ActiveRecord::RecordNotFound => e
          # 指定されたアイテムが見つからない場合はエラーを返す
          raise GraphQL::ExecutionError.new("指定されたアイテムが見つかりませんでした。")
        end
      end

      favorites
    end


    # お気に入り削除（配列）
    field :delete_favorites, Boolean, null: false do
      # 引数
      argument :item_ids, [String], required: true
      argument :email, String, required: true
    end

    def delete_favorites(item_ids:, email:)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "ユーザーが見つかりません。"
      end

      # 各 item_id に対して処理を行う
      item_ids.each do |item_id|
        begin
          # 苦手ネタを削除する
          favirite = Favorite.find_by(item_id: item_id, user: user)
          favirite.destroy if favirite
        rescue ActiveRecord::RecordNotFound => e
          # 指定された食材が見つからない場合はエラーを返す
          raise GraphQL::ExecutionError.new("ネタが見つかりません。")
        end
      end

      # 成功した場合は true を返す
      true
    end



    # --------------------------------
    # dislikes / 苦手ネタ
    # --------------------------------

    # 苦手ネタ登録
    field :create_dislikes, [Types::DislikeType], null: false do
      # 引数
      argument :ingredient_ids, [String], required: true
      argument :email, String, required: true
    end

    def create_dislikes(ingredient_ids:, email:)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "指定されたメールアドレスに対応するユーザーが見つかりませんでした。"
      end

      dislikes = []

      # 各 ingredient_id に対して処理を行う
      ingredient_ids.each do |ingredient_id|
        begin
          # 苦手ネタを作成する
          dislike = Dislike.create(ingredient_id: ingredient_id, user: user)
          dislikes << dislike
        rescue ActiveRecord::RecordNotFound => e
          # 指定された食材が見つからない場合はエラーを返す
          raise GraphQL::ExecutionError.new("指定された食材が見つかりませんでした。")
        end
      end

      dislikes
    end


    # 苦手ネタ削除
    field :delete_dislikes, Boolean, null: false do
      # 引数
      argument :ingredient_ids, [String], required: true
      argument :email, String, required: true
    end

    def delete_dislikes(ingredient_ids:, email:)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "ユーザーが見つかりません。"
      end

      # 各 ingredient_id に対して処理を行う
      ingredient_ids.each do |ingredient_id|
        begin
          # 苦手ネタを削除する
          dislike = Dislike.find_by(ingredient_id: ingredient_id, user: user)
          dislike.destroy if dislike
        rescue ActiveRecord::RecordNotFound => e
          # 指定された食材が見つからない場合はエラーを返す
          raise GraphQL::ExecutionError.new("ネタが見つかりません。")
        end
      end

      # 成功した場合は true を返す
      true
    end


    # --------------------------------
    # user / ユーザー登録
    # --------------------------------

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
