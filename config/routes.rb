Rails.application.routes.draw do
  resources :posts, param: :slug, :path => '/'
end
