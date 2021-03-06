Rails.application.routes.draw do
  namespace :api do
    resources :complaints, only: :create
    resources :bids, only: :create
    resources :buyers, only: %i(show create update destroy)
    resources :companies, only: %i(create)
    resources :sellers, only: %i(show create update destroy)
    resources :auctions, only: %i(index show create update destroy)
    resources :users, only: :update
  end

  namespace :admin do
    resources :complaints, only: :index
    resources :bids, only: %i(destroy)
    resources :users, only: %i(index destroy)
    resources :sellers, only: %i(show update destroy)
    resources :buyers, only: %i(show update destroy)
    resources :auctions, only: %i(index show update destroy)
  end

  post 'sessions/login'
  get 'sessions/get_current_user'
end
