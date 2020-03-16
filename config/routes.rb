Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :users,    only: [:edit, :update]
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes,    only: [:create, :destroy]
  end
end
