Rails.application.routes.draw do
  root 'tracks#index'

  resources :tracks do
    collection do
      get '/update' => 'tracks/update#index'
      post '/update' => 'tracks/update#create'
    end
  end
  resources :artists, :only => [:index, :show]
  get '/lyrics' => 'lyrics#index'

  get '/activity/all' => 'activity#all'
  get '/activity/last_30_days' => 'activity#last_30_days'

  namespace :api do
    resources :tracks, only: [:index] do
      post :search, on: :collection
    end
  end
end
