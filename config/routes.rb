Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resource :profile, only: [:show]
  root 'posts#index'
end
