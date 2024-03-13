Rails.application.routes.draw do
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
