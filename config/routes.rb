Rails.application.routes.draw do
  root "posts#home"

  get 'posts/index'
end
