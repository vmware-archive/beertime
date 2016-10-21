Rails.application.routes.draw do
  resources :requests, only: [:new, :create, :index, :destroy]
  root to: redirect('/requests')
end
