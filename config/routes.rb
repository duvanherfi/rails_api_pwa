Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :projects do
    resources :tasks do
      resources :images do
        get :file, on: :member
      end
      resources :audios do
        get :file, on: :member
      end
    end
  end
  resources :types
  resources :positions
  resources :users
  resources :clients
  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
