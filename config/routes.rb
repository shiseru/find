Rails.application.routes.draw do
  resources :rooms
  get '/' => "home#top"
  get 'about' => "home#about"
  
  devise_for :users
  resources :items
  
  root to: "items#index"
end
