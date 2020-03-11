Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users,    only: [:edit, :update]
  resources :posts,    only: [:index, :create, :edit, :new, :show]
  resources :comments, only: :create 
end
