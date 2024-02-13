Rails.application.routes.draw do
  resources :hospitalization_items
  resources :service_orders do
    resources :service_queue_items
  end
  resources :inventory_items, except: %i[show]
  resources :pets
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
    resources :customers, only: %i[index show new create edit update destroy]
  end

  # root 'devise/sessions#new', as: :unauthenticated_root

  # devise_scope :user do
  #   get "/users/new" => "devise/sessions#new"
  # end

  get "/calendar", to: "dashboard#calendar"

  unauthenticated do
    root to: 'landing_page#index'
  end

  # match '*path', to: redirect('/'), via: :all
end
