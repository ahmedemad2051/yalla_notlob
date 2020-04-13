Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #  get "/post/", to: "posts#index"

  get '/friends/search' => 'friends#search', :as => 'search_page'

  resources :friends
  resources :groups
  

 
end
