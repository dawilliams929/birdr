Birdr::Application.routes.draw do
  root 'observations#new'
  
  resources :sightings, only: [:show, :index]
  resources :locations, only: [:create, :new, :show]
  resources :observations, only: [:create, :new, :show, :index]
end
