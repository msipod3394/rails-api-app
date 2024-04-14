module Resolvers
  class CurrentUser < Resolvers::BaseQuery
    type ObjectTypes::User, null: false

    def resolve
      context[:current_user]
    end
  end
end
