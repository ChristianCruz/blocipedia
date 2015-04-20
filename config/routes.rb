Rails.application.routes.draw do

  # get 'user/downgrade'
  get 'user/upgrade'

  resources :charges, only: [:new, :create]

  resources :user, only: [:update, :show, :index] do
    post "toggle_role"
  end

  #CRUD for wikis
  resources :wikis

  devise_for :users

  get 'about' => "welcome#about"

  root to: 'wikis#index'
end