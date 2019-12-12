Rails.application.routes.draw do
  
  namespace :master do
      resources :users
      resources :admins
      resources :alerts
      resources :cities
      resources :counterparts
      resources :countries
      resources :departments
      resources :donations
      resources :follows
      resources :likes
      resources :organizations
      resources :organization_links
      resources :projects
      resources :project_links
      resources :tags
      resources :tag_lists

      root to: "users#index"
    end
    
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  # Supprimer ces pages vendredi
  get '/design', to: 'static_pages#show'
  get '/test', to: 'static_pages#test'

  resources :charges, only: [:new, :create]
  resources :users, only: [:show, :update]
  resources :organizations, except: :destroy
  resources :projects, except: :destroy
  resources :donations, only: [:new, :create]
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :organization_links, only: [:create, :destroy]
  resources :project_links, only: [:create, :destroy]
  resources :tags, only: [:create]
  resources :tag_lists, only: [:create, :destroy]
end
