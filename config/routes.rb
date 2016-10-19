Rails.application.routes.draw do
  resources :requests, only: [:new, :create]
  root "requests#new"
end
