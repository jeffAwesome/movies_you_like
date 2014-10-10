MoviesYouLike::Application.routes.draw do
  resources :reviews

  resources :movies do
    resource :like_movie, module: :movies
  end

  resources :users

  resources :playlists

  resources :playlist_movies

  resources :person

  devise_for :users
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
