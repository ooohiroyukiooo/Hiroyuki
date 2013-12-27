Hiroyuki::Application.routes.draw do

  root to: "tops#index"

  resources :articles
  resource :user, only: [:show, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root to: "top#index"
    resources :articles
    resource :user, only: [:show, :edit, :update]
    resource :session, only: [:new, :create, :destroy]
  end
end
