Rails.application.routes.draw do

  devise_for :users
  
  root "posts#index"
  
  resources :users,    only: [:edit, :update]
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes,    only: [:create, :destroy]
  end
end
