Birdr::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root 'observations#new'
  
  resources :sightings, only: [:show, :index]
  resources :locations, only: [:create, :new, :show]
  resources :observations, only: [:create, :new, :show, :index]
  resources :species, only: [:index]
end
