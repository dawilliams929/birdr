Birdr::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root 'observations#new'
  
  resources :sightings, only: [:show, :index]
  resources :locations, only: [:create, :new, :show]
  resources :observations, only: [:create, :new, :show, :index]
  resources :species, only: [:index, :show]
end
