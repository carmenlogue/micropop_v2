Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :artists
    resources :poems
    resources :songs
    resources :tags

    get '/', action: :index
  end

  get 'alphabet' => 'pages#alphabet'
  get 'hits'     => 'pages#hits'
  get 'best'     => 'pages#best'

  resources :poems, param: :reference

  root 'pages#home'
end
