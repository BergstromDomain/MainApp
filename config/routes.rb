Rails.application.routes.draw do
  root to: 'pages#home'
  
  get 'home',           to: 'pages#home'
  get 'about',          to: 'pages#about'
  get 'contact',        to: 'pages#contact'
  get 'event-tracker',  to: 'pages#event_tracker'

  resources :people
  resources :events
end
