Birdr::Application.routes.draw do
  root 'sightings#new'
  
  resources :sightings
  resources :locations
end
