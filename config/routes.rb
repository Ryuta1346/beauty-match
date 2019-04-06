Rails.application.routes.draw do
  devise_for :salons
  root 'salons#index'

  namespace :admin do
    resources :salons do
      resources :salon_reservations
      # get :books
    end
  end

  resources :salons do
    resources :salon_reservations
    resources :stylists
  end

  resources :stylists
  resources :users
  resources :categories, only: [:index, :show]

  get '/books', to: 'salon_reservations#books'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
