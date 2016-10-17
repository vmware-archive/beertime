Rails.application.routes.draw do
  resource :dashboard, controller: :dashboard
  resources :beers
  root "dashboard#show"
end
