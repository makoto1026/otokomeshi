Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts do
    collection do
      get 'search'
      get 'ngword'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
    end
    resources :likes, only: [:show, :create, :destroy]
  end
  resources :categories, only: :show

end
