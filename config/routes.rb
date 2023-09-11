Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :yachts

  get 'my_yachts', to: 'yachts#my_yachts'
end
