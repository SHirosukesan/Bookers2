 Rails.application.routes.draw do
  devise_for :users
  root :to  => "users#home"
  get "home/about" => "users#home2"
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end