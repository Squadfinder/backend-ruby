Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rawg_search
    end
  end
end
