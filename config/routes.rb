Rails.application.routes.draw do
  root to: 'photos#index'

  resources :contacts, only: [:new, :create, :show]
  mount LetterOpenerWeb::Engine, at: "letter_opener" if Rails.env.development?

  resources :sessions, only: [:new, :create, :destroy]

  resources :photos do
    collection do
      post :confirm
    end
    resources :likes, only: [:create, :destroy]
    resources :clips, only: [:create, :destroy]
  end

  resources :users
end