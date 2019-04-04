Rails.application.routes.draw do
  root 'categories#index'

  resources :salons do
    resources :salon_reservations
    resources :stylists
  end

  resources :stylists
  resources :users
  # resources :salon_reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
