Rails.application.routes.draw do
  resources :beers, only: [:new]
  resources :requests, only: [:new, :create, :index, :destroy]
  root to: redirect('/requests')
end
