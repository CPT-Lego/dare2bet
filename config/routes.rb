Rails.application.routes.draw do
  devise_for :users
  root to: "bets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :bets do
    get "resolve", to: "bets#resolve"
    patch "set_result", to: "bets#set_result"
  end

  get 'users/:id', to: "users#show", as: 'user'

  get "my_bets", to: "bets#my_bets"

  get "home", to: "pages#home"

  get "around_me", to: "bets#around_me"

end
