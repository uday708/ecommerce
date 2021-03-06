Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: :create
  resource :carts, only: [:show, :update, :destroy]
  resources :menu_items, only: [:index, :create, :destroy]
end
