Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :projects
    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  root 'home#index'

  resources :home, only: :index
  resources :projects do
    member do
      get 'members'
    end
    resources :members, only: [:create, :destroy]
  end
  resources :tasks
  resources :kanban, only: :index
  resources :messages
  resources :users
  #Avatar routes
  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background], font: params[:font] })
  }, as: :avatar
end
