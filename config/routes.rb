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

  resources :users
  resources :items
  post "items/rooms/:owner_id/:participant_id/create" => "rooms#create"

  root to: "items#index"
end
