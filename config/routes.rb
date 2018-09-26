Rails.application.routes.draw do

    get '/signup', to: 'users#new'

    get '/signin', to: 'sessions#new'

    post '/signin', to: 'sessions#create'

    resources :users, only: [ :new, :create, :show ]

    resources :events, only: [ :new, :create, :show, :index]

end
