Rails.application.routes.draw do
  resources :members

  namespace :api do
    resources :auth
  end

  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'
end
