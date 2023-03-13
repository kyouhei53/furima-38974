Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  post 'items/new'
  resources :items do
    resources :buys, only: [:index, :create]
  end
end
