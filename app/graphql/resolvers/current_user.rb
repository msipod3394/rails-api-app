module Resolvers
  class CurrentUser < Resolvers::BaseQuery
    type ObjectTypes::UserType, null: false

    def resolve
      context[:current_user]
    end
  end
end
