Rails.application.routes.draw do
  resources :historia
  resources :registrations, only: [:create]
  resources :users
  get :sessions, to: 'sessions#index'
  delete :logout, to: "sessions#destroy"
  post :logged_in, to: "sessions#create"
  root to: "sessions#new"
end
