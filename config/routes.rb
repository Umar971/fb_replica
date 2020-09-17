Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end
  resources :likes, only: [:destroy]
  resource :profile, only: [:show]
  root 'posts#index'
end
