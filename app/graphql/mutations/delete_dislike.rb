# 苦手ネタ削除

module Mutations
  class DeleteDislike < BaseMutation
    description "苦手ネタ削除"

    # 引数の定義
    argument :ingredient_id, ID, required: true
    argument :user_id, ID, required: true

    # フィールドの定義
    field :success, Boolean, null: false

    # ミューテーションの処理
    def resolve(ingredient_id:, user_id:)
      dislike = Dislike.find_by(ingredient_id: ingredient_id, user_id: user_id)
      if dislike
        dislike.destroy
        { success: true }
      else
        GraphQL::ExecutionError.new("Dislike with ingredient ID #{ingredient_id} for user ID #{user_id} not found.")
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      GraphQL::ExecutionError.new("Failed to delete dislike with ingredient ID #{ingredient_id} for user ID #{user_id}.")
    end
  end
end
