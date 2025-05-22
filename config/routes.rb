Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :show]
end
