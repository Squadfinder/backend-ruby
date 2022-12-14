Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :search, controller: "rawg_search"
      resources :games, only: [ :show ] do
        resources :users, only: [ :index ], controller: 'games/users'
      end
      resources :squads, only: [ :create ]
      resources :users, only: [ :index, :show ] do
        resources :games, only: [ :index, :destroy, :create ], controller: 'users/games'
        resources :squads, only: [ :index, :create, :destroy ], controller: 'users/squads'
      end
    end
  end
end
