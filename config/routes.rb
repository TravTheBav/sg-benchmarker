Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'static_pages#landing'
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about
end
