Rails.application.routes.draw do
  
  namespace :master do
    resources :users
    resources :admins
    resources :organizations
    resources :projects
    resources :donations
    resources :counterparts
    resources :alerts
    resources :follows
    resources :likes
    resources :organization_links      
    resources :project_links
    resources :tags
    resources :tag_lists     
    resources :cities      
    resources :countries
    resources :departments

    root to: "users#index"
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'

  resources :charges, only: [:new, :create]
  resources :users, only: [:show, :update] do
    resources :avatars, only: [:create]
  end
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
