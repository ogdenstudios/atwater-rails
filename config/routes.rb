Rails.application.routes.draw do
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

  get '/about', to: "pages#about"
  get '/services', to: "pages#services"
  get '/process', to: "pages#process_page"
  get '/rates', to: "pages#rates"
  get '/contact', to: "pages#contact"

end
