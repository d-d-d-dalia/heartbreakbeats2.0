Rails.application.routes.draw do
  resources :songs

  resources :users do
    resources :songs
  end
  
  resources :vibes
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#homepage"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/users/:id/severevibes', to: 'song_vibes#most_severe_vibes', as: "song_vibes"

  get '/auth/facebook/callback', to: 'sessions#oauth'

end