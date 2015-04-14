Rails.application.routes.draw do
  # get 'user/edit'

  # get 'user/update'

  resources :user, only: [:update, :show, :index]

  #CRUD for wikis
  resources :wikis

  devise_for :users

  get 'about' => "welcome#about"

  root to: 'welcome#index'
end