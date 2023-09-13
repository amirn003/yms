Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :yachts
  get 'my_yachts', to: 'yachts#my_yachts'
end
