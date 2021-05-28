Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  # get '/lists', to: 'lists#index'
  # get '/lists/new', to: 'lists#new'
  # get '/lists/:id', to: 'lists#show', as: :list
  # post 'lists', to: 'lists#create'
  
  # resources :lists, except: [:edit, :update, :destroy] do
  resources :lists, only: [:index, :new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
