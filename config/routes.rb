Rails.application.routes.draw do
  devise_for :users

  root to: 'static_pages#landing'

  # static page routes
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about

  # user routes with scoped resources
  resources :users, only: [:show] do
    resources :build_orders
  end

  get 'users/:id/account_info', to: 'users#account_info', as: :show_account_info

  # routes for adding and deleting build order steps
  resources :build_order_steps, only: [], param: :index do
    member do
      delete '(:id)' => "build_order_steps#destroy", as: ""
      post '/' => "build_order_steps#create"
    end
  end
end