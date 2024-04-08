# 苦手ネタ登録

module Mutations
  class CreateDislike < BaseMutation
    description "苦手ネタ登録"

    # 引数の定義
    argument :ingredient_id, ID, required: true
    argument :email, String, required: true

    # フィールドの定義
    field :dislike, Types::DislikeType, null: false

    # ミューテーションの処理
    def resolve(ingredient_id:, email:)
      ingredient = Ingredient.find(ingredient_id)
      user = User.find_by(email: email)

      # ユーザーが存在しない場合はエラーを返す
      unless user
        raise GraphQL::ExecutionError, "指定されたメールアドレスに対応するユーザーが見つかりませんでした。"
      end

      # 苦手ネタを作成する
      dislike = Dislike.create(ingredient: ingredient, user: user)

      { dislike: dislike }
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("指定されたネタが見つかりませんでした。")
    end
  end
end
