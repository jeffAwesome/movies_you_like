MoviesYouLike::Application.routes.draw do
  resources :reviews

  resources :movies do
    resource :like_movie, module: :movies
  end

  get '/members/', :to => "users#index"

  resources :playlists

  resources :playlist_movies

  resources :person

  #devise_for :users
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get '/members/:id', :to => "users#show", :as => :user

  get "search/index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'static#index'

  get 'static/related'

  get 'static/view', as: :static_view

  get 'static/exactMovie'

  get 'static/about'


end
