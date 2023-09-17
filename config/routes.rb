Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'business', to: 'pages#business'
  get 'income', to: 'pages#income'
  get 'calendar', to: 'pages#calendar'


  resources :yachts do
    resources :bookings, only:[:new,:create]
  end
  get 'my_yachts', to: 'yachts#my_yachts'
  resources :bookings ,only: [:edit,:destroy,:update,:index]
end
