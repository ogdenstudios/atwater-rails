Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/home', to: "pages#index"
  get '/about', to: "pages#about"
  get '/services', to: "pages#services"
  get '/process', to: "pages#process_page"
  get '/rates', to: "pages#rates"
  get '/contact', to: "pages#contact"
  get '/pay', to: "pages#pay"
  get '/portfolio', to: "portfolios#index"
  get '/portfolio/all', to: "portfolios#all" 
  get '/portfolio/:slug', to: "portfolios#show"

  resources :authors, param: :slug
  resources :books
  resources :genres
  resources :subgenres
  resources :payment_intents, only: [:create]
end
