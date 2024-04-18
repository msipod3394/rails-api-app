module Resolvers
  class Task < Resolvers::AuthQuery
    argument :id, ID, required: true

    type ObjectTypes::TaskType, null: false

    def resolve(id:)
      user = context[:current_user] # context[:current_user] でログイン済みユーザ情報を取得できる
      user.tasks.find(id)
    end
  end
end
