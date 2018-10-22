Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :artists
    resources :poems

    get '/', action: :index
  end
end
