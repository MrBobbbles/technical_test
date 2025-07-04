Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # nested resources because the photos belong to a gallery
  resources :galleries do
    resources :photos
  end

  get "profile", to: "galleries#user_galleries", as: "user_galleries"

  get "galleries/:id/slideshow", to: "galleries#slideshow", as: "gallery_slideshow"

  root "galleries#index"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
