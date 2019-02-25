Rails.application.routes.draw do
  devise_for :users
  authenticate :user do 
    resources :authors, only: [:index, :new, :create, :edit, :update, :destroy], param: :slug
    resources :books
    resources :genres
  end 
  
  resources :authors, only: [:show], param: :slug

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/home', to: "pages#index"
  get '/about', to: "pages#about"
  get '/services', to: "pages#services"
  get '/process', to: "pages#process_page"
  get '/rates', to: "pages#rates"
  get '/contact', to: "pages#contact"
  get '/portfolio', to: "pages#portfolio"
end
