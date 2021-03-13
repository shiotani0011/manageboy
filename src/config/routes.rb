Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'}
  end

  namespace :api do
    resources :auth do
      collection do
        post :register
        post '/login', to: 'sessions#login'
      end
    end
    resources :members
  end

  # post '/signup', to: 'registrations#signup'
  # post '/login', to: 'sessions#login'
  # delete '/logout', to: 'sessions#logout'
  # get '/logged_in', to: 'sessions#logged_in?'
end
