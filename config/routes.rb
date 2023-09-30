Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'business', to: 'pages#business'
  get 'income', to: 'pages#income'
  get 'calendar', to: 'pages#calendar'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  resources :yachts do
    resources :bookings, only:[:new,:create]
  end
  resources :chatrooms, only: [:show,:index,:new,:create] do
    resources :messages, only: :create
  end
  get 'my_yachts', to: 'yachts#my_yachts'
  get 'tracker', to: 'yachts#tracker'
  get 'tracker_move', to: 'yachts#tracker_move'
  resources :bookings ,only: [:edit,:destroy,:update,:index]
end
