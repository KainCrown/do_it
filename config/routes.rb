Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :projects

    root to: "users#index"
  end

  devise_for :users
  root 'home#index'

  resources :home, only: :index
  resources :projects
  resources :tasks
end
