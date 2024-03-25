Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :v1 do
    jsonapi_resources :addresses
    jsonapi_resources :locations
  end
end
