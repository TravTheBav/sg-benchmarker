Rails.application.routes.draw do
  devise_for :users

  root to: 'static_pages#landing'

  # static page routes
  get 'landing', to: 'static_pages#landing', as: :landing
  get 'about', to: 'static_pages#about', as: :about
end