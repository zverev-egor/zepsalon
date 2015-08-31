Rails.application.routes.draw do

  resources :infos

  resources :users


  root 'infos#index'

  get 'login'=>'sessions#new', as: :login
  post 'login'=>'sessions#create'
  get 'logout'=>'sessions#destroy', as: :logout

end
