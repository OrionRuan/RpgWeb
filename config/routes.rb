Rails.application.routes.draw do
  resources :historia
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :users
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "sessions#new"
end
