Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "profile", to: "users#profile"
  get "users/:id/edit", to: "users#edit", as: :edit_user

  resources :users, only: :index

  resources :bets, except: [:new, :edit] do
    collection do
      get "multiform_step_1"
    end
    get "multiform_step_2"
    get "multiform_step_3"
    get "resolve"
    patch "set_result"

    post 'accept'
    post 'deny'
  end

  get "my_bets", to: "bets#my_bets"
  get "around_me", to: "bets#around_me"
end
