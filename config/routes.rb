Cornucopia::Application.routes.draw do

  resources :users
  # You can have the root of your site routed with "root"
  root 'users#index'

match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
