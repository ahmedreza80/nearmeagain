Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shops
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :products

  resources :charges

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
  get '/cart/tracking', to: 'orders#show', as: :tracking



  
  get 'welcome/home'
  root "welcome#home"
  get 'welcome/rest'
  get 'welcome/auto'
  get 'welcome/electronics'
  get 'welcome/fashion'
  get 'welcome/gs'
  get 'welcome/grocery'
  get 'welcome/furniture'
  get 'welcome/health'
  get 'welcome/repair'
  get 'welcome/recent'
  get 'welcome/popular'
  get 'welcome/events'
  get 'welcome/contact'
  get 'welcome/about'
  get 'welcome/search'
  get 'welcome/decor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # new routes
  resources :registeration_numbers do
    resources :orders, controller: 'registeration_numbers/orders'
  end
  post :get_cities_by_state,       action: :get_cities_by_state, controller: :products

   get "/users/auth/facebook", to: "users#sign_in"
   get "/users/auth/twitter", to: "users#sign_in"
   get "/users/auth/google_oauth2", to: "users#sign_in"
   devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "users/registrations" , sessions: "users/sessions"}

end
