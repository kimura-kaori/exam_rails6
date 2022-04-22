Rails.application.routes.draw do
  root 'properties#index'
  resources :properties
  resources :nearest_stations
end
