Rails.application.routes.draw do
  namespace :api do
    resources :buyers, only: %i(show create update destroy)
    resources :companies, only: %i(create)
    resources :sellers, only: %i(show create update destroy)
  end

  namespace :admin do
    resources :users, only: %i(index destroy)
    resources :sellers, only: %i(show update destroy)
    resources :buyers, only: %i(show update destroy)
  end

  post 'users/login'
end
