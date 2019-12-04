Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  get '/design', to: 'static_pages#show'
  resources :static_pages
  resources :charges
  resources :users, only: [:show]
  resources :organizations
  resources :projects
end
