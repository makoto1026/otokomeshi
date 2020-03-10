Rails.application.routes.draw do
  root "posts#search"

  get 'posts/index'
end
