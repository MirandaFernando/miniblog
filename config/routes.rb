Rails.application.routes.draw do
  resources :posts
  get 'home/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
