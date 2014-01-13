Cornucopia::Application.routes.draw do

  resources :parties
  #for secret token link - is the attendee going to come to the party?
  get 'parties/:id/rsvp' => 'parties#rsvp_show'
  post 'parties/:id/rsvp/no' => 'parties#rsvp_no'
  post 'parties/:id/rsvp/yes' => 'parties#rsvp_yes'
  get '/parties/:id/items' => 'parties#items'
  post '/parties/:id/items' => 'parties#add_item'
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
