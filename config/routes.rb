Rails.application.routes.draw do
  
  get '/' => "home#top"
  get 'about' => "home#about"
  
  resources :rooms
  post "rooms/:id/create_message" => "rooms#create_message"

  devise_for :users

  resources :users
  resources :items
  get "items/rooms/:owner_id/:participant_id/create" => "rooms#create"
  
  root to: "items#index"
end
