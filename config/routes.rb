Soundly::Application.routes.draw do
  root :to => "tracks#index"
  resources :tracks do
    collection do
      post '/update' => 'tracks/update#create'
    end
  end
  resources :artists, :only => [:index]
end
