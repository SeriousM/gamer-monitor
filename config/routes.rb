QuackingNemesis::Application.routes.draw do
  mount RailsAdmin::Engine => '/system_admin', as: 'rails_admin'
  
  mount Genghis::Server.new, at: '/mongodb_admin', as: 'genghis' if defined? Genghis
  
  root to: 'static_pages#home'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/news',    to: 'static_pages#news'

  resources :users, only: [ :index, :show ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', as: :signin
  match '/signout' => 'sessions#destroy', as: :signout
  match '/auth/failure' => 'sessions#failure'
  
  resources :activities, only: [ :index ]

  resources :wow, only: [ :index, :new, :create, :destroy ] do
    get '/refrsh', to: 'wow#refresh', as: :refresh
  end
  resources :wot, only: [ :index, :new, :create, :destroy ]
  resources :bf3, only: [ :index, :new, :create, :destroy ] do
    get '/refrsh', to: 'bf3#refresh', as: :refresh
  end
end
