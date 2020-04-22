Rails.application.routes.draw do
  
  post 'register', to: 'authintication#register'
  post 'login', to: 'authintication#login'
  root :to => "authintication#index"
  get '/home' => 'home#index'
  get '/orders/add' => 'add_orders#index'
  get '/orders' => 'add_orders#list'



  # post 'orders/:id', to: 'add'
  get '/orders/:id', to: 'add_orders#order_details'
  # post '/orders/:id', to: 'add_orders#order_details'
  post '/orders/:id/save_items', to: 'add_orders#save_items'
  get '/orders/:id/show_joined_friends', to: 'add_orders#show_joined_friends'
  get '/orders/:id/show_invited_friends', to: 'add_orders#show_invited_friends'
  get '/orders/:id/show_invited_friends/:id', to: 'add_orders#delete_invited_friend'
  # get '/orders' => 'list_orders#index'
  post '/add' => 'add_orders#add'
  post '/search' => 'add_orders#search'

  
  post '/cancel/:id' => 'add_orders#cancel'
  post '/finish/:id' => 'add_orders#finish'
  get '/friends/search' => 'friends#search', :as => 'search_page'

  get '/friends/friends_activity', to: 'friends#list_activities'
  
  resources :friends
  resources :groups
  # resources :order_details
  resources :notifications do
    collection do
      post :mark_as_reads
    end  
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
