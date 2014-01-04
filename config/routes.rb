Birdr::Application.routes.draw do
  root 'sightings#new'
  
  resources :sightings, only: [:create, :new, :show, :index]
  resources :locations, only: [:create, :new, :show]
end
