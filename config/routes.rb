 Rails.application.routes.draw do
  devise_for :users
  root :to  => "users#home"
  get "home/about" => "users#home2"
  resources :users
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
 end
end