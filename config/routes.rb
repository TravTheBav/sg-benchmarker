Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'static_pages#landing'

  # static page routes
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about

  # user routes with scoped resources
  resources :users do
    resources :build_orders
    resources :attack_benchmarks
  end

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
end
