Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :projects
    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  root 'home#index'

  resources :home, only: :index
  resources :projects
  resources :tasks
  resources :kanban, only: :index
end
