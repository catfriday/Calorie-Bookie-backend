Rails.application.routes.draw do
  # resources :food_items
  # resources :food_entries
  # resources :daily_logs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, :daily_logs, :food_entries, :food_items, :bets 
      post '/login', to: 'auth#login'
      get '/profile', to: 'users#profile'
    end
  end
end
