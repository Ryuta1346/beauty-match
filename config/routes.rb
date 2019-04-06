Rails.application.routes.draw do
  root 'static_pages#top'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  devise_for :stylists, controllers: {
      sessions:      'stylists/sessions',
      passwords:     'stylists/passwords',
      registrations: 'stylists/registrations'
  }
  devise_for :salons, controllers: {
      sessions:      'salons/sessions',
      passwords:     'salons/passwords',
      registrations: 'salons/registrations'
  }
  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }

  namespace :admin do
    resources :stylists
    resources :salons do
      resources :salon_reservations
    end
  end

  resources :salons, only: [:show, :index] do
    resources :salon_reservations
    get '/member', to: 'stylists#member'
  end

  resources :stylists
  resources :users
  resources :categories, only: [:index, :show]

  get '/books', to: 'salon_reservations#books'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
