Rails.application.routes.draw do
  root "publications#index"
  
  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'

  resources :comments, only: [:create]
  resources :publications


  devise_for :users

  # Health check and PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
