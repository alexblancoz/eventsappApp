Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  get '/splash', to:'pages#splash'
  
  resources :events
  
end