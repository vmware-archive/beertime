Rails.application.routes.draw do
  resources :requests, only: [:new, :create, :index]
  root "requests#new"
end
