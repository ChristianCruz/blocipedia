Rails.application.routes.draw do
  #CRUD for wikis
  resources :wikis

  devise_for :users

  get 'about' => "welcome#about"

  root to: 'welcome#index'
end