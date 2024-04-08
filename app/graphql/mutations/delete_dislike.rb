# 苦手ネタ削除

module Mutations
  class DeleteDislike < BaseMutation
    description "苦手ネタ削除"

    # 引数の定義
    argument :ingredient_id, ID, required: true
    argument :email, String, required: true

    # フィールドの定義
    field :success, Boolean, null: false

    # ミューテーションの処理
    def resolve(ingredient_id:, email:)
      user = User.find_by(email: email)
      if user
        dislike = Dislike.find_by(ingredient_id: ingredient_id, user_id: user.id)
        if dislike
          dislike.destroy
          { success: true }
        else
          GraphQL::ExecutionError.new("メールアドレス #{email} のユーザーには、食材ID #{ingredient_id} に関連する嫌いなものが見つかりませんでした。")
        end
      else
        GraphQL::ExecutionError.new("メールアドレス #{email} のユーザーが見つかりませんでした。")
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      GraphQL::ExecutionError.new("メールアドレス #{email} のユーザーに関連する食材ID #{ingredient_id} の嫌いなものの削除に失敗しました。")
    end
  end
end
