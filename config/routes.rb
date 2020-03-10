Rails.application.routes.draw do
  root "posts#post"

  get 'posts/index'
end
