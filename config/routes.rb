Rails.application.routes.draw do
  root 'static_pages#landing'
  devise_for :users

  resources :genres, only: %i[index show new create update] do
    resources :collections, only: %i[new]
  end

  resources :collections, only: %i[show create update] do
    resources :writings, only: %i[new]
  end

  resources :writings, only: %i[index show create edit update]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
