Rails.application.routes.draw do
  get 'home/index'
  
  resource :posts

  root 'home#index'
end
