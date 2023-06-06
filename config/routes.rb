Rails.application.routes.draw do
  devise_for :users
  root to: "bets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :bets

  get 'users/:id', to: "users#show", as: 'user'

end
