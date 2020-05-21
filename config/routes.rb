Rails.application.routes.draw do
  
  root to: 'home#top'
  get 'home/about' => "home#about"
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    get :search, on: :collection
    get 'user_search' => "user#user_search", on: :collection
  	member do
  		get :following, :followers
  	end
  end

  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end