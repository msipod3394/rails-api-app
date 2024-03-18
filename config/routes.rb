Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post "/graphql", to: "graphql#execute"
  get 'ingredient_item/index'
  get 'ingredient_item/show'
  get 'item_ingredient/index'
  get 'item_ingredient/show'
  get 'dislike/index'
  get 'dislike/show'
  get 'favorite/index'
  get 'favorite/show'
  get 'order/index'
  get 'order/show'
  get 'product/index'
  get 'product/show'
  get 'ingredients/index'
  get 'ingredients/show'
  get 'user/index'
  get 'user/show'
  get 'neta/index'
  get 'neta/show'
  get 'item/index'
  get 'item/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
