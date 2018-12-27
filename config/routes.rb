Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :artists
    resources :poems
    resources :songs
    resources :tags

    get '/', action: :index
  end

  get 'alphabet'  => 'pages#alphabet'
  get 'hits_list' => 'pages#hits_list'
  get 'best'      => 'pages#best'

  resources :poems, param: :reference do
    get :autocomplete, on: :collection
  end
  resources :artists, only: [:index] do
    get :scoped_index, on: :collection
  end
  resources :hits,    only: [:index]

  root 'pages#home'
end
