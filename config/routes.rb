Rails.application.routes.draw do
  root 'categories#index'

  resources :salons do
    resources :reservations
  end
  resources :stylists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
