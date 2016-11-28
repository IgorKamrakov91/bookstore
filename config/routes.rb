Rails.application.routes.draw do
  root 'books#index'

  get 'about' => 'about#index'

  resources :books 
  resources :authors 
  resources :publishers 
  resources :categories
end
