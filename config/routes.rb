Cornucopia::Application.routes.draw do

  resources :parties

  resources :users
  resources :maps
  resources :attendees
  resources :items
  
  get 'recipes/import' => "recipes#import"
  resources :recipes
  resources :rides
  resources :categories

  # You can have the root of your site routed with "root"
  root 'users#index'
  # authentication routing
	post 'authentications' => 'authentications#create' 
  get 'authentications/new' => 'authentications#new'

  # delete 'authentications/' => 'authentications#destroy'
  get "/logout", to: "authentications#destroy", as: "logout"
end
