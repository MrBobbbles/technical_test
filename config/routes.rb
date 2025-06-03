Rails.application.routes.draw do
  get "photos/index"
  get "photos/show"
  get "photos/new"
  get "photos/create"
  get "photos/edit"
  get "photos/update"
  get "photos/destroy"
  get "galleries/index"
  get "galleries/show"
  get "galleries/new"
  get "galleries/create"
  get "galleries/edit"
  get "galleries/update"
  get "galleries/destroy"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :galleries
  resources :photos
  
  root "galleries#index"

end
