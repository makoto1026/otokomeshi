Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users,    only: [:edit, :update]
  resources :posts,    only: [:index, :create, :edit, :new, :show] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  # namespace :posts do 
  #   resources :searches, only: :index
  # end
  
end
