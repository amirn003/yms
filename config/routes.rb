Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'incomes', to: 'pages#incomes'

  resources :yachts, :bookings
  get 'my_yachts', to: 'yachts#my_yachts'
end
