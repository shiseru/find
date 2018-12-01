Rails.application.routes.draw do

  # practice
  # get 'p' => "rooms#show"
  # 
  resources :rooms
  get '/' => "home#top"
  get 'about' => "home#about"
  
  devise_for :users
  resources :items
  
  root to: "items#index"
end
