Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:edit, :update]
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  post '/profile/edit', to: 'users#update'
  resources :saunas do
    resources :bookings
    resources :reviews, only: [:new, :create]
  end

  # resources :reviews, only: [ :destroy ]
end
