Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'static_pages#landing'

  # static page routes
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about

  # user routes
  resources :users do
    resources :build_orders
  end

  resources :build_order_steps, only: [], param: :index do
    member do
      delete '(:id)' => "build_order_steps#destroy", as: ""
    end
  end
end
