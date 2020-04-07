Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users,    only: [:edit, :update]
  resources :posts do
    collection do
      get 'search'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :likes,    only: [:create, :destroy]
  end
  resources :categories, only: :show

end
