Rails.application.routes.draw do
  resources :users
  resource :session
  root to: "users#index"

  resources :items
end
