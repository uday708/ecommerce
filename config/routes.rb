Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: :create
  resources :carts, only: [:index, :update]
  resources :menu_items, only: [:index, :create]
end
