Rails.application.routes.draw do
  devise_for :salons
  root 'salons#index'

  resources :salons do
    resources :salon_reservations
    resources :stylists
  end

  resources :stylists
  resources :users
  resources :categories, only: [:index, :show]

  # resources :salon_reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
