Rails.application.routes.draw do
  root 'collections#index'
  devise_for :users

  resources :collections, only: %i[index show new create] do
    resources :writings, only: %i[new]
  end
  resources :writings, only: %i[show create]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
