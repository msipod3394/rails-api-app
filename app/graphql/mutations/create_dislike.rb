# 苦手ネタ登録

module Mutations
  class DeleteDislike < BaseMutation
    description "苦手ネタ削除"

    # input型の定義
    class InputType < Types::BaseInputObject
      argument :ingredient_id, ID, required: true
      argument :user_id, ID, required: true
    end

    # 引数の定義
    argument :input, InputType, required: true

    # フィールドの定義
    field :success, Boolean, null: false

    # ミューテーションの処理
    def resolve(input:)
      dislike = Dislike.find_by(ingredient_id: input[:ingredient_id], user_id: input[:user_id])
      if dislike
        dislike.destroy
        { success: true }
      else
        GraphQL::ExecutionError.new("Dislike with ingredient ID #{input[:ingredient_id]} for user ID #{input[:user_id]} not found.")
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      GraphQL::ExecutionError.new("Failed to delete dislike with ingredient ID #{input[:ingredient_id]} for user ID #{input[:user_id]}.")
    end
  end
end
