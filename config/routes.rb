Rails.application.routes.draw do
  resources :requests, only: :new
  root "requests#new"
end
