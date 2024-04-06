# 苦手ネタ登録

module Mutations
  class CreateDislike < BaseMutation
    description "苦手ネタ登録"

    # 引数の定義
    argument :ingredient_id, ID, required: true
    argument :user_id, ID, required: true

    # フィールドの定義
    field :dislike, Types::DislikeType, null: false

    # ミューテーションの処理
    def resolve(ingredient_id:, user_id:)
      ingredient = Ingredient.find(ingredient_id)
      user = User.find(user_id)

      # 苦手ネタを作成する
      dislike = Dislike.create(ingredient: ingredient, user: user)

      { dislike: dislike }
    end
  end
end
