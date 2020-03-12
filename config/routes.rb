Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  namespace :posts do 
    resources :searches, only: :index
  end
  resources :users,    only: [:edit, :update]
  resources :posts,    only: [:index, :create, :edit, :new]
  resources :comments, only: :create 
  get'/posts/:id', to: 'posts#show'
end
