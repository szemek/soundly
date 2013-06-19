Soundly::Application.routes.draw do
  root :to => redirect('/tracks')
  resources :tracks do
    post '/update' => 'tracks/update#create', :on => :collection
  end
  resources :artists, :only => [:index, :show]
end
