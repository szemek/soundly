Soundly::Application.routes.draw do
  root :to => redirect('/tracks')
  resources :tracks do
    collection do
      get '/update' => 'tracks/update#index'
      post '/update' => 'tracks/update#create'
      get '/search' => 'tracks/search#index'
    end
  end
  resources :artists, :only => [:index, :show]
  get '/lyrics' => 'lyrics#index'

  get '/activity' => 'activity#show'
end
