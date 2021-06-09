Rails.application.routes.draw do

  root :to => "tasks#index"
  require 'sidekiq/web'
  Sidekiq::Web.set :sessions, false
  authenticate :user do
      mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
