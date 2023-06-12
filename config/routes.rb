Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :bets do
    get "resolve"
    patch "set_result"
  end

  get "my_bets", to: "bets#my_bets"
  get "around_me", to: "bets#around_me"

  get 'users/:id', to: "users#show", as: 'user'
end
