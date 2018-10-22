Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :poems

    get '/', action: :index
  end
end
