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
    resource :stylist do
      resources :menus
      resources :stylist_reservations
      get '/reservations', to: 'reservations#index_for_stylist'
      get '/reservations/:id', to: 'reservations#show_for_stylist', as: 'reservation'
      put '/reservations/:id', to: 'reservations#update_for_stylist'
      patch '/reservations/:id', to: 'reservations#update_for_stylist'
      delete '/reservations/:id', to: 'reservations#destroy_for_stylist'
      get '/reservations/:id/edit', to: 'reservations#edit_for_stylist', as: 'reservation/edit'
      get '/sales', to: 'reservations#sales_for_stylist'
    end

    resource :salon do
      resources :salon_reservations
      resources :reservations, only: [:show, :index, :update, :destroy, :edit]
      get '/history', to: 'reservations#history'
      get '/sales', to: 'reservations#sales'
      resources :stylists, only: [:show, :index]
    end
  end

  resources :salons, only: [:show, :index] do
    resources :salon_reservations, only: [:index, :show]
    get '/member', to: 'stylists#member'
  end

  resources :stylists, only: [:show, :index] do
    resources :stylist_reservations, only: [:index, :show]
  end

  resources :users
  resources :reservations, except: [:new, :edit, :update]
  resources :categories, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
