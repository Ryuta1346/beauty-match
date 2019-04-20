Rails.application.routes.draw do
  namespace :admin do
    get 'stylist_sales_memos/show'
    get 'stylist_sales_memos/index'
    get 'stylist_sales_memos/edit'
  end
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
      resources :stylist_sales_memos, except: [:index, :edit, :create, :new]
      get '/reservations', to: 'stylist_sales_memos#index'
      get '/sales', to: 'stylist_sales_memos#sales'
    end

    resource :salon do
      resources :salon_reservations
      resources :reservations, only: [:show, :index, :update, :destroy]
      get '/history', to: 'reservations#history'
      get '/sales', to: 'reservations#sales'
      resources :stylists, only: [:show, :index]
    end
  end

  resources :salons, only: [:show, :index] do
    resources :salon_reservations
    get '/member', to: 'stylists#member'
  end

  resources :stylists, only: [:show, :index] do
    resources :stylist_reservations
  end

  resources :users
  resources :reservations, except: [:new, :edit, :update]
  resources :categories, only: [:index, :show]
  resources :stylist_reservations, only: [:show, :index]

  get '/books', to: 'salon_reservations#books'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
