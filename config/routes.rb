Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  get '/splash', to:'pages#splash'
  
  resources :events do
    member do
      get 'favorite'
      get 'ticket'
    end
  end
  
  resources :users, except:[:new]
  
  get '/register', to: 'users#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
end
