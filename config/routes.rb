Rails.application.routes.draw do
  
  get '/' => "home#top"
  get 'about' => "home#about"
  get 'mypage' => "home#mypage"

  resources :rooms, only: [:show, :destroy]
  post "rooms/:id/create_message" => "rooms#create_message"

  devise_for :users

  resources :users

  resources :items
  post "items/rooms/:owner_id/:participant_id/create" => "rooms#create"

  root to: "items#index"
end
