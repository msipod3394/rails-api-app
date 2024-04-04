# 注文履歴

module Mutations
  class CreateOrder < BaseMutation
    description "Create a new order"

    # 引数の定義
    argument :item_id, ID, required: true
    argument :user_id, ID, required: true

    # フィールドの定義
    field :order, Types::OrderType, null: false

    # ミューテーションの処理
    def resolve(item_id:, user_id:)
      item = Item.find(item_id)
      user = User.find(user_id)

      # 新しい注文を作成する
      order = Order.create(item: item, user: user)

      { order: order }
    end
  end
end
