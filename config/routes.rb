Rails.application.routes.draw do
  root "study_materials#index"

  resource :session
  resources :passwords, param: :token, only: [ :new ]
  resources :study_materials

  get "up" => "rails/health#show", as: :rails_health_check
end
