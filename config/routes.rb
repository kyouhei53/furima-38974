Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  post 'items/new'
  resources :items do
    resources :comments, only: :create
    resources :buys, only: [:index, :create]
  end
end
