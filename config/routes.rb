ZombieLlama::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  # resources :users
  resources :games
  get "event_runner", to: "games#event_runner", as: :event_runner

  # resources :supplies
end