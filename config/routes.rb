Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :projects
    resources :tasks
    resources :sprints

    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  root 'home#index'

  resources :home, only: :index
  resources :projects
  resources :tasks
  resources :sprints
  resources :kanban, only: :index
end
