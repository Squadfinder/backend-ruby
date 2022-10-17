Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/games/:game_id', to: 'games#show'
      resources :users, only: [ :index, :show ] do
        resources :usergames 
      end
    end
  end
end
