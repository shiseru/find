Rails.application.routes.draw do
  
  get '/' => "home#top"
  get 'about' => "home#about"
  # practice
  # get 'p' => "rooms#show"
  # 
  # get "rooms/:id" => "rooms#show"
  resources :rooms
  post "rooms/:id/create_message" => "rooms#create_message"

  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  resources :users
  resources :items
  
  root to: "items#index"
end
