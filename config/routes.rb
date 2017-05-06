Rails.application.routes.draw do
  namespace :api do
    resources :sellers, only: :create
    resources :buyers, only: :create
  end

  post 'users/login'
end
