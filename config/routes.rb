Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    get 'password', to: 'user#password'
    resources :lists do
      resources :tasks
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
