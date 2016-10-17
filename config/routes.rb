Rails.application.routes.draw do
  resources :pizzerias
  root "pizzerias#index"
end
