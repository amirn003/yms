Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'business', to: 'pages#business'
  get 'income', to: 'pages#income'
  get 'calendar', to: 'pages#calendar'

  resources :yachts do
    resources :bookings, only:[:new,:create]
  end
  resources :chatrooms, only: [:show,:index,:new,:create] do
    resources :messages, only: :create
  end

  resources :crew do
    member do
      post 'assign_user' # Route pour assigner un utilisateur à un groupe
    end
  end

  get 'my_yachts', to: 'yachts#my_yachts'
  get 'tracker', to: 'yachts#tracker'
  get 'tracker_move', to: 'yachts#tracker_move'
  resources :bookings ,only: [:edit,:destroy,:update,:index]
end
