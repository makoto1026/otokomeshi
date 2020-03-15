Rails.application.routes.draw do

  devise_for :users
  
  root "posts#index"
  
  resources :users,    only: [:edit, :update]
  resources :posts,    only: [:index, :create, :edit, :new, :show, :destroy] do
    collection do
      get 'search'
    end
    resources :likes,    only: [:create, :destroy]
  end
end
