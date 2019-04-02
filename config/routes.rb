Rails.application.routes.draw do
  root to: 'photos#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :photos do
    collection do
      post :confirm
    end
    resources :likes, only: [:create, :destroy]
  end

  resources :users
end