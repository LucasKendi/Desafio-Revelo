Rails.application.routes.draw do
  resources :posts, param: :slug, :path => '/', :except => [:new]
end
