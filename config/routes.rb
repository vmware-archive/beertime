Rails.application.routes.draw do
  resources :requests, only: [:new, :create, :index, :destroy]
  root "requests#new"
end
