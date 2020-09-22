Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end
  resources :comments, except: [:new, :create, :edit, :update, :show, :destroy] do
    resources :replies, only: [:create, :destroy]
  end

  resources :requests, only: [:create, :destroy, :update]
  resources :likes, only: [:destroy]
  resource :profile, only: [:show] do 
    collection do
      get :friends
    end
  end
  root 'posts#index'
end
