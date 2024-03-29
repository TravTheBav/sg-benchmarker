Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/build_orders'
    get 'admin/attack_benchmarks'
  end

  devise_for :users

  root to: 'static_pages#landing'

  # static page routes
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about

  # user routes with scoped resources
  resources :users, only: [:show] do
    resources :build_orders
    resources :attack_benchmarks
  end

  get 'users/:id/account_info', to: 'users#account_info', as: :show_account_info

  # routes for adding and deleting build order steps
  resources :build_order_steps, only: [], param: :index do
    member do
      delete '(:id)' => "build_order_steps#destroy", as: ""
      post '/' => "build_order_steps#create"
    end
  end

  # routes for adding and deleting benchmark units
  resources :units, only: [], param: :index do
    member do
      delete '(:id)' => "units#destroy", as: ""
      post '/' => "units#create"
    end
  end

  # create route for profile pictures
  resources :profile_pictures, only: [:create]
end