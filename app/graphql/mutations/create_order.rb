# 注文履歴登録

# module Mutations
#   class CreateOrder < BaseMutation
#     description "注文履歴登録"

#     # 引数の定義
#     argument :item_id, ID, required: true
#     argument :email, ID, required: true

#     # フィールドの定義
#     field :order, Types::OrderType, null: false

#     # ミューテーションの処理
#     def resolve(item_id:, email:)
#       item = Item.find(item_id)
#       user = User.find(email)

#       # 新しい注文を作成する
#       order = Order.create(item: item, user: user)

#       { order: order }
#     end
#   end
# end
