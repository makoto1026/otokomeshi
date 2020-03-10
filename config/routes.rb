Rails.application.routes.draw do
  root "posts#index"

  get 'posts/index'
end
