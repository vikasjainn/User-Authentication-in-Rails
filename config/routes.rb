# Rails.application.routes.draw do
#   get 'users/register'
#   get 'users/login'
#   get 'users/logout'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end
Rails.application.routes.draw do
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
end
