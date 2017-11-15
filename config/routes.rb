Rails.application.routes.draw do
  resources :serviced_routes
  resources :service_providers
  root "public#home"
  get 'public/home'

  resources :routes
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
