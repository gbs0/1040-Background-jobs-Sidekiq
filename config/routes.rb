require 'sidekiq'

Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  post '/post/validate', to: "posts#validate"
  # Defines the root path route ("/")
  # root "articles#index"
end
