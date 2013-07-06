Soundly::Application.routes.draw do
  root :to => redirect('/tracks')
  resources :tracks do
    get '/update' => 'tracks/update#index', :on => :collection
    post '/update' => 'tracks/update#create', :on => :collection
    get '/search' => 'tracks/search#index', :on => :collection
  end
  resources :artists, :only => [:index, :show]
end
