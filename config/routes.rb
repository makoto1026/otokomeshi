Rails.application.routes.draw do
  devise_for :users
  namespace :posts do 
    resources :searches, only: :index
  end
  root "posts#index"
  resources :users,    only: [:edit, :update]
  resources :posts 
  resources :comments, only: :create 
end
