Rails.application.routes.draw do
  root to: 'photos#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :photos do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end